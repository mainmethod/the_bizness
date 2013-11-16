class LocationsController < ApplicationController
  
  def show
    @location = Location.includes(:users).find(params[:id])
  end
  
  def nearby
    @location = request.location.state ? current_user.location : request.location
    @proximity = params[:proximity] ? params[:proximity] : 200
    @locations = @location.nearbys(@proximity).unshift(@location)
  end
end