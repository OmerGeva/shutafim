class ListingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_listing, only: [:show]

  def index
    @listings = policy_scope(Listing).all
    authorize @listings
  end

  def show
    authorize @listing
  end

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

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:price, :duration)
  end
end
