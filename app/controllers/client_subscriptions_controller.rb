class ClientSubscriptionsController < ApplicationController
  def destroy
    ClientSubscription.find(params[:id]).destroy

    flash[:notice] = 'Client Subscription was destroyed'

    redirect_to clients_subscriptions_homepages_path
  end

  def new; end

  def create
    ClientSubscription.create(client_subscription_params)

    flash[:notice] = 'Client Subscription was created'

    redirect_to clients_subscriptions_homepages_path
  end

  def update
    client_subscription = ClientSubscription.find(params[:id])

    client_subscription.update(client_subscription_params)

    flash[:notice] = 'Client Subscription was updated'

    redirect_to clients_subscriptions_homepages_path
  end

  def edit
    @client_subscription = ClientSubscription.find(params[:id])
  end

  private

  def client_subscription_params
    params.require(:client_subscription).permit(ClientSubscription.column_names.map(&:to_sym))
  end
end
