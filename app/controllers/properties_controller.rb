class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      if @property.save
        redirect_to properties_path, notice: "物件情報を登録しました"
      else
        render :new
      end
    end
  end

  def show
    @stations = @property.stations
  end

  def edit
    @property.stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件情報を削除しました"
  end

  def confirm
    @property = Property.new(property_params)
    render :new if @property.invalid?
  end
  private
  def property_params
    params.require(:property).permit(
      :name,
      :price,
      :address,
      :age,
      :remarks,
      stations_attributes: [
        :rail,
        :name,
        :time,
        :property_id,
        :id,
        :_destroy,
      ],
    )
  end
  def set_property
    @property = Property.find(params[:id])
  end
end
