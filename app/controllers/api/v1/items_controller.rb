class Api::V1::ItemsController < ApplicationController

  def index
    render  status: 200,
            json: Item.select("id, name, description, image_url").all

  end

  def show
    render  status: 200,
            json: Item.select("id, name, description, image_url").find(params[:id])
  end

  def destroy
    render json: Item.find(params[:id]).destroy,
      status: 204
  end

  def create
    Item.create!(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url]
      )
    render json: Item.select("id, name, description, image_url").last,
      status: 201
  end

end
