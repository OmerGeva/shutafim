class ProfilesController < ApplicationController
  def new
    @profile = Profile.new

    authorize @profile
  end

  def show
    @profile = current_user.profile
    @listings = current_user.listings
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    traits = Trait.new
    params[:profile][:trait].each do |trait|
      traits.has_cat = trait == 'Cat'
      traits.has_dog = trait == 'Dog'
      traits.smokes = trait == 'Smokes'
      traits.veg = trait == 'Vegeterian'
    end
    traits.save
    @profile.user = current_user
    @profile.trait = traits
    if @profile.save
      redirect_to root_path
    else
      render :new
    end

    authorize @profile
  end

  private

  def profile_params
    params.require(:profile).permit(:gender, :profession, :about_me, :photo)
  end
end
