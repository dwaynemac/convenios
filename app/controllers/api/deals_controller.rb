class Api::DealsController < ApplicationController
  # Leave index.json PUBLIC
  [:authenticate_user!,:require_padma_account,:set_current_account,:set_timezone,:set_locale].each do |auth_filter|
    skip_filter auth_filter, only: [:index, :show]
  end

  respond_to :json

  def index
    @deals = Deal.order(:category_id)
                 .includes([:business,:category])
                 .query(params[:q])
                 .all
    respond_with @deals, :callback => params[:callback]
  end

  def show
  	@deal = Deal.find(params[:id])
  	respond_with @deal, :callback => params[:callback]
  end
end
