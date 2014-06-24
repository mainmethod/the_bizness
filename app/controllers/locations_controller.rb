class LocationsController < ApplicationController
  
  def show
    @location  = Location.includes(:users).find(params[:id])
    @proximity = params[:proximity] ? params[:proximity] : 200
    @locations = @location.nearbys(@proximity).unshift(@location)
  end
  
  def nearby
    if(!request.location.state.empty?)
      @location = Location.where(:city => request.location.city, :state => request.location.state).first_or_create
    else
      @location = current_user.location
    end
    @proximity = params[:proximity] ? params[:proximity] : 200
    @locations = @location.nearbys(@proximity).unshift(@location)
  end
end