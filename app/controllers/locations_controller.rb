class LocationsController < ApplicationController
  
  def show
    @location = Location.includes(:users).find(params[:id])
  end
  
  def nearby
    if(!request.location.state.empty?)
      @location = Location.find_or_create_by_city_and_state(request.location.city,request.location.state)
    else
      @location = current_user.location
    end
    @proximity = params[:proximity] ? params[:proximity] : 200
    @locations = @location.nearbys(@proximity).unshift(@location)
  end
end