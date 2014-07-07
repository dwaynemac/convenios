class BusinessesController < ApplicationController
  
  load_and_authorize_resource

  def update
    success = @business.update_attributes(business_params)
    respond_with_bip @business
  end

  private

  def business_params
    params.require(:business).permit(:name,:address, :city, :url, :email, :phone)
  end
end
