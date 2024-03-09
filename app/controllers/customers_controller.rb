class CustomersController < ApplicationController
  include Pagy::Backend
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @customers = pagy(Customer.all, items: count)
  end

  def search
    query = params[:search]
    records = Customer.name_like(query)

    @records = records.map { |m| Hash[m.id => m.id + " " + m.company_name] }

    render(json: @records)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to(@customer, notice: "Customer was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to(@customer, notice: "Customer was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @customer.destroy!
    redirect_to(people_url, notice: "Customer was successfully destroyed.", status: :see_other)
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
      :id,
      :company_name,
      :contact_name,
      :contact_title,
      :phone,
      :fax
    )
  end
end
