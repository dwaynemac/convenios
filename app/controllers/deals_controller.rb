class DealsController < ApplicationController

  # Leave index.json PUBLIC
  [:authenticate_user!,:require_padma_account,:set_current_account,:set_timezone,:set_locale].each do |auth_filter|
    skip_filter auth_filter, only: :index, if: :format_json?
  end

  respond_to :html, :json

  def index
    @deals = Deal.query(params[:q]).all
    respond_with @deals
  end

  def new
    @deal = Deal.new
    @deal.business = Business.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to deals_url, notice: t('deals.create.success')
    else
      render action :new
    end
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(deal_params)
      redirect_to deals_path, notice: t('deals.update.success')
    else
      redirect_to deals_path, alert: t('deals.update.error')
    end
  end

  def cancel
    @deal = Deal.find(params[:id])
    if @deal.update_attribute(:ends_on, Date.today)
      redirect_to deals_path, notice: t('deals.cancel.success')
    else
      redirect_to deals_path, alert: t('deals.cancel.error')
    end
  end

  private

  def deal_params
    params.require(:deal).permit(
        :title,
        :description,
        :responsible_user,
        business_attributes: [:name,:phone,:email,:url,:address]
    )
  end

  def format_json?
    request.format.json?
  end

end
