class AddressesController < ApplicationController
  def index
    render 'new'
  end

  def new; end

  def create
    @address = AddressParser.new(address_params).parse

    if @address && @address.save
      flash.now[:success] = "Your address was successfully validated and saved!"
    else
      flash.now[:warning] = "This address is invalid. Please try again."
    end 
    
    render 'new'
  end

  private

    def address_params
      params.permit(:house_number, :street_name, :city, :state, :zip_code)
    end
end
