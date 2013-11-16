class LocationsController < ApplicationController
  
  def show
    @location = Location.includes(:users).find(params[:id])
  end
  
  def nearby
    @current_location = current_user.location # this will end up being request.location
    @proximity = params[:proximity] ? params[:proximity] : 200
    @all_locations = @current_location.nearbys(@proximity)
  end
end