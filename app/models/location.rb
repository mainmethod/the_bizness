class Location < ActiveRecord::Base
  attr_accessible :city, :country, :latitude, :longitutde, :state, :zipcode
  attr_accessor :address
  has_many :users
  
  geocoded_by :address do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country
      obj.state = geo.state
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    result = nil
    results.each do |r|
      r.data['address_components'].each do |c|
        if(c['types'].include?('locality') && (c['short_name']==obj.city || c['long_name']==obj.city))
          result = r
        end
      end
    end
    if geo = result || results.first
      obj.city = geo.city
      obj.zipcode = geo.postal_code
      obj.country = geo.country
      obj.state = geo.state
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode, :reverse_geocode
  
  def address
    [city, state].compact.join(', ')
  end
end
