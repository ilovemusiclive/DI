class PropertiesController < ApplicationController
  before_action :find_property, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].blank?
      @properties = Property.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @properties = Property.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if params[:category].blank?
      @properties = Property.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @properties = Property.where(:category_id => @category_id).order("created_at DESC")
    end

  end

  def new
    @property = current_admin.properties.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @property = current_admin.properties.build(property_params)
    @property.category_id = params[:category_id]

      if @property.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @property.category_id = params[:category_id]

    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      render 'edit'
    end
  end

  def destroy
    @property.destroy
    redirect_to root_path
  end

  def home

  end

  private

  def property_params
    params.require(:property).permit(:description, :street, :city, :country, :zimmer, :size, :category_id, :property_img)
  end

  def find_property
    @property = Property.find(params[:id])
  end

end
