class PropertiesController < ApplicationController
  def index
  end

  def new
    @property = Property.new
  end

  def create
    Property.create(name: params[:property][:name], price: params[:property][:price],
                    address: params[:property][:address], age: params[:property][:age],
                    remarks: params[:property][:remarks])
    redirect_to properties_path
  end
end
