class ClientsController < ApplicationController
  def destroy
    Client.find(params[:id]).destroy

    flash[:notice] = 'Client was destroyed'

    redirect_to clients_homepages_path
  end

  def new; end

  def create
    Client.create(client_params)

    flash[:notice] = 'Client was created'

    redirect_to clients_homepages_path
  end

  def update
    client = Client.find(params[:id])

    client.update(client_params)

    flash[:notice] = 'Client was updated'

    redirect_to clients_homepages_path
  end

  def edit
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(Client.column_names.map(&:to_sym))
  end
end

