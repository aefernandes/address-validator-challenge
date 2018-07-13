class Address < ApplicationRecord
  
  # Prints out the address components as follows:
  # house_number street_predirection street_name street_type street_postdirection unit_type unit_number, city, state, zip_5
  def to_s
    street_components = [
      house_number, street_predirection, street_name, street_type, 
      street_postdirection, unit_type, unit_number
    ].compact.delete_if(&:empty?).join(' ')
    return "#{street_components}, #{city}, #{state} #{zip_5}"
  end
  
end
