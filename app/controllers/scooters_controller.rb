class ScootersController < ApplicationController
  def destroy
    Scooter.find(params[:id]).destroy

    flash[:notice] = 'Scooter was destroyed'

    redirect_to scooters_homepages_path
  end

  def new; end

  def create
    Scooter.create(scooter_params)

    flash[:notice] = 'Scooter was created'

    redirect_to scooters_homepages_path
  end

  def update
    scooter = Scooter.find(params[:id])

    scooter.update(scooter_params)

    flash[:notice] = 'Scooter was updated'

    redirect_to scooters_homepages_path
  end

  def edit
    @scooter = Scooter.find(params[:id])
  end

  private

  def scooter_params
    params.require(:scooter).permit(Scooter.column_names.map(&:to_sym))
  end
end


