class EmployeesController < ApplicationController
  include Pagy::Backend
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @employees = pagy(
      Employee
        .left_outer_joins(:manager)
        .select(:id, :first_name, :last_name, :reports_to, :hire_date)
        .select("managers_employees.first_name as manager_first_name")
        .select("managers_employees.last_name as manager_last_name")
        .all,
      items: count
    )
  end

  def search
    query = params[:q]
    records = Employee.name_like(query)

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "search_results",
            partial: "employees/search_results",
            locals: {employees: records}
          )
        )
      end
    end
  end

  def show
    @manager = @employee.manager
  end

  def edit
    @manager = @employee.manager
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    password = "password"
    @employee.password = password
    @employee.password_confirmation = password

    if @employee.save
      redirect_to(show_employee_path(@employee), notice: "Employee was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to(show_employee_path(@employee), notice: "Employee was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @employee.destroy!
    redirect_to(index_employee_path, notice: "Employee was successfully destroyed.", status: :see_other)
  end

  private

  def employee_id
    params[:employee_id] || params[:id]
  end

  def set_employee
    @employee = Employee.includes(:manager).find(employee_id)
  end

  def employee_params
    params.permit(
      :email,
      :last_name,
      :first_name,
      :reports_to,
      :title,
      :title_of_courtesy,
      :birth_date,
      :hire_date,
      :home_phone,
      :extension,
      :photo
    )
  end

end
