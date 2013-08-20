class Api::DealsController < ApplicationController
  # Leave index.json PUBLIC
  [:authenticate_user!,:require_padma_account,:set_current_account,:set_timezone,:set_locale].each do |auth_filter|
    skip_filter auth_filter, only: :index
  end

  respond_to :json

  def index
    @deals = Deal.query(params[:q]).all
    respond_with @deals
  end
end
