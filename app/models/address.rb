class Address < ApplicationRecord
  NUMERICAL_REGEXP = /\d+/  # Verifies numericality without allowing + or -
  validates :house_number, presence: true, format: { with: NUMERICAL_REGEXP} 
  validates :street_name, :street_type, :city, :state, :zip_5, presence: true
  validates :zip_5, length: { is: 5}, format: { with: NUMERICAL_REGEXP }

  # Prints out the address components as follows:
  # house_number street_predirection street_name street_type street_postdirection unit_type unit_number, city, state, zip_5
  def to_s
    "#{street_address}, #{city}, #{state} #{zip_5}"
  end

  # Joins street address components with a space and removes blanks
  def street_address
    [
      house_number, 
      street_predirection, 
      street_name, 
      street_type, 
      street_postdirection, 
      unit_type, 
      unit_number
    ].compact.delete_if(&:empty?).join(' ')
  end
end
