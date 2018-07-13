class AddressParser
    attr_accessor :street_address, :city, :state, :zip_code
  
    def initialize(params)
      params.each { |key, value| send "#{key}=",value}
    end
  
    def parse
      parsed_address = StreetAddress::US.parse(combined_address_string)
      if parsed_address && valid_location?
        address = Address.new(
          house_number: parsed_address.number,
          street_name: parsed_address.street,
          street_type: parsed_address.street_type,
          street_predirection: parsed_address.prefix,
          street_postdirection: parsed_address.suffix,
          unit_number: parsed_address.unit,
          unit_type: parsed_address.unit_prefix,
          city: parsed_address.city,
          state: parsed_address.state,
          zip_5: parsed_address.postal_code,
          zip_4: parsed_address.postal_code_ext)
  
        return address
        end
  
        nil
      end
  
      def combined_address_string
        "#{street_address}, #{city}, #{state}, #{zip_code}"
      end
  
      def valid_location?
        geocoded = Geocoder.search(combined_address_string).first
        geocoded && !geocoded.partial_match
      end
    end