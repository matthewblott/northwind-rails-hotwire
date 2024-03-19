class CustomersController < ApplicationController
  include Pagy::Backend
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @customers = pagy(Customer.all, items: count)
  end

  def show
    @customer = Customer.find(customer_id)
  end

  def edit
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to(show_customer_path(@customer), notice: "Customer was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to(show_customer_path(@customer), notice: "Customer was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @customer.destroy!
    redirect_to(index_customer_path, notice: "Customer was successfully destroyed.", status: :see_other)
  end

  private
  def set_customer
    @customer = Customer.find(customer_id)
  end

  def customer_id
    params[:customer_id]
  end

  def customer_params
    params.permit(
      :id,
      :company_name,
      :contact_name,
      :contact_title,
      :region,
      :phone,
      :fax
    )
  end
end
