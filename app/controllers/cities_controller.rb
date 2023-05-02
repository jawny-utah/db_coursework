class CitiesController < ApplicationController
  def destroy
    City.find(params[:id]).destroy

    flash[:notice] = 'City was destroyed'

    redirect_to cities_homepages_path
  end

  def new; end

  def create
    City.create(city_params)

    flash[:notice] = 'City was created'

    redirect_to cities_homepages_path
  end

  def update
    city = City.find(params[:id])

    city.update(city_params)

    flash[:notice] = 'City was updated'

    redirect_to cities_homepages_path
  end

  def edit
    @city = City.find(params[:id])
  end

  private

  def city_params
    params.require(:city).permit(City.column_names.map(&:to_sym))
  end
end


