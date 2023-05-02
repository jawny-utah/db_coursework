class AdministratorsController < ApplicationController
  def destroy
    Administrator.find(params[:id]).destroy
    redirect_to administrators_homepages_path
  end

  def new; end

  def create
    Administrator.create(admin_params)

    redirect_to administrators_homepages_path
  end

  def update
    administrator = Administrator.find(params[:id])

    administrator.update(admin_params)

    redirect_to administrators_homepages_path
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  private

  def admin_params
    params.require(:administrator).permit(Administrator.column_names.map(&:to_sym))
  end
end
