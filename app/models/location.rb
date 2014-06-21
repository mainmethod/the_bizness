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
      if(r.city == obj.city)
        result = r
        break
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
  
  scope :search, lambda{|term|
    where("LOWER(city) like LOWER(?) or LOWER(state) like LOWER(?)","%#{term}%","%#{term}%"). \
    order("(city LIKE '%#{term}%') DESC, LENGTH(city) ASC, city ASC")
  }
  
  def address
    [city, state].compact.join(', ')
  end
end
