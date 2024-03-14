class CustomerAddressesController < ApplicationController
  before_action :set_customer, only: %i[show edit update]
  before_action :set_delete_customer_address, only: %i[destroy]

  def index
    @customer = Customer.find(customer_id)
  end

  def show
  end

  def new
    @address = Address.new
    # @customer = Customer.find(customer_id)
    # @customer.addresses.build
  end

  def edit
  end

  def create
    @customer = Customer.find(customer_id)
    @customer.addresses.create(
      :name => params[:name],
      :address_line_1 => params[:address_line_1],
      :address_line_2 => params[:address_line_2],
      :postal_town => params[:postal_town],
      :country => params[:country],
      :post_code => params[:post_code]
    )
    if @customer.save

      address_id = @customer.addresses.last.id

      # render(:new, status: :see_other)
      redirect_to(
        show_customer_address_path(customer_id, address_id),
        notice: "Address was successfully created.",
        status: :see_other
      )
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to(
        show_customer_address_path(customer_id, address_id),
        notice: "Address was successfully updated.",
        status: :see_other
      )
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @customer.addresses.find(address_id).destroy
    redirect_to(index_customer_address_path, notice: "Address was successfully destroyed.", status: :see_other)
  end

  private

  def customer_id
    params[:customer_id]
  end

  def address_id
    params[:address_id]
  end

  def set_customer
    @customer = Customer
      .eager_load(:addresses)
      .where("customer_id = '#{customer_id}'")
      .where(
        "address_id = #{address_id}"
      )
      .first
  end

  def set_delete_customer_address
    @customer = Customer.find(customer_id)
  end

  def address_params
    params.require(:address).permit(
      :name,
      :address_line_1,
      :address_line_2,
      :postal_town,
      :county,
      :country,
      :post_code
    )
  end

  def customer_params
    customer_params = params.require(:customer).permit(
      addresses_attributes: [
        :id,
        :address_line_1,
        :address_line_2,
        :postal_town,
        :county,
        :country,
        :post_code
      ]
    )
  end

end
