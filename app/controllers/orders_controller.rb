class OrdersController < ApplicationController
  include Pagy::Backend
  before_action :set_order, only: %i[show edit update destroy]

  def index
    # todo: get this from the paramaters so we can vary the page count
    count = 10
    @pagy, @orders = pagy(
      Order.includes(:employee, :customer, :address),
      items: count
    )
  end

  def show
    @order = Order.find(order_id)
  end

  def edit
  end

  def new
    @order = Order.new
    @order.order_date = Date.today
    @order.employee_id = current_employee.id
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to(show_order_path(@order), notice: "Order was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @order.update(order_params)
      redirect_to(show_order_path(@order), notice: "Order was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @order.destroy!
    redirect_to(index_order_path, notice: "Order was successfully destroyed.", status: :see_other)
  end

  private

  def set_order
    # @order = Order.includes(:address).includes(:order).includes(:employee).find(params[:id])
    # @address = @order.address
    # @order = @order.order
    # @employee = @order.employee

    @order = Order.find(order_id)
  end

  def order_id
    params[:order_id]
  end

  def order_params
    params.permit(
      :id,
      :employee_id,
      :customer_id,
      :order_date,
      :shipped_date,
      :address_id,
      :shipping_fee,
      :payment_type,
      :paid_date
    )
  end
end
