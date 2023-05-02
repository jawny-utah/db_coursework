class SubscriptionsController < ApplicationController
  def destroy
    Subscription.find(params[:id]).destroy

    flash[:notice] = 'Subscription was destroyed'

    redirect_to subscriptions_homepages_path
  end

  def new; end

  def create
    Subscription.create(subscription_params)

    flash[:notice] = 'Subscription was created'

    redirect_to subscriptions_homepages_path
  end

  def update
    subscription = Subscription.find(params[:id])

    subscription.update(subscription_params)

    flash[:notice] = 'Subscription was updated'

    redirect_to subscriptions_homepages_path
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  private

  def subscription_params
    params.require(:subscription).permit(Subscription.column_names.map(&:to_sym))
  end
end


