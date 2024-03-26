class ProductsController < ApplicationController
  include Pagy::Backend
  before_action :set_product, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @products = pagy(Product.all, items: count)
  end

  def search
    query = params[:search]
    records = Product.name_like(query)
    @records = records.map { |m| Hash[m.id => m.id.to_s + " " + m.product_code + " " + m.product_name] }
    render(json: @records)
  end

  def show
    @product = Product.find(product_id)
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(show_product_path(@product), notice: "Product was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @product.update(product_params)
      redirect_to(show_product_path(@product), notice: "Product was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @product.destroy!
    redirect_to(index_product_path, notice: "Product was successfully destroyed.", status: :see_other)
  end

  private
  def set_product
    @product = Product.find(product_id)
  end

  def product_id
    params[:product_id]
  end

  def product_params
    params.permit(
      :product_code,
      :product_name,
      :description,
      :standard_cost,
      :list_price,
      :discontinued
    )
  end
end
