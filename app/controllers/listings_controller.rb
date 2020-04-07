class ListingsController < ApplicationController
  def new
    @listing = Listing.new
    @apartment = Apartment.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      redirect_to new_listing_path
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:price, :duration)
  end
end
