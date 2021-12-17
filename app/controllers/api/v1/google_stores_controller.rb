class Api::V1::GoogleStoresController < ApplicationController
  def index
    places = GetGoogleCoffeeListService.new(
      params[:latitude], 
      params[:longitude]
    ).call
    
    render json: places
  end
end
