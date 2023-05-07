class ScooterInWorksController < ApplicationController
  def destroy
    ScooterInWork.find(params[:id]).destroy

    flash[:notice] = 'Scooter In Work was destroyed'

    redirect_to scooters_in_work_homepages_path
  end

  def new; end

  def create
    ScooterInWork.create(scooter_in_work_params)

    flash[:notice] = 'Scooter In Work was created'

    redirect_to scooters_in_work_homepages_path
  end

  def update
    scooter_in_work = ScooterInWork.find(params[:id])

    scooter_in_work.update(scooter_in_work_params)

    flash[:notice] = 'Scooter In Work was updated'

    redirect_to scooters_in_work_homepages_path
  end

  def edit
    @scooter_in_work = ScooterInWork.find(params[:id])
  end

  private

  def scooter_in_work_params
    params.require(:scooter_in_work).permit(ScooterInWork.column_names.map(&:to_sym))
  end
end
