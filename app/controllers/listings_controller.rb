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

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
