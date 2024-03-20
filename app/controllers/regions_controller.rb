class RegionsController < ApplicationController
  include Pagy::Backend
  before_action :set_region, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @regions = pagy(Region.all, items: count)
  end

  def show
    @region = Region.find(region_id)
  end

  def edit
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to(show_region_path(@region), notice: "Region was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @region.update(region_params)
      redirect_to(show_region_path(@region), notice: "Region was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @region.destroy!
    redirect_to(index_region_path, notice: "Region was successfully destroyed.", status: :see_other)
  end

  private
  def set_region
    @region = Region.find(region_id)
  end

  def region_id
    params[:region_id]
  end

  def region_params
    params.permit(:name)
  end
end
