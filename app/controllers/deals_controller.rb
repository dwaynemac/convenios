class DealsController < ApplicationController

  load_and_authorize_resource

  respond_to :html

  def index
    @deals = @deals.query(params[:q]).all
    respond_with @deals
  end

  def new
    @deal.business = Business.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to deals_url, notice: t('deals.create.success')
    else
      render action: :new
    end
  end

  def update
    if @deal.update_attributes(deal_params)
      redirect_to deals_path, notice: t('deals.update.success')
    else
      redirect_to deals_path, alert: t('deals.update.error')
    end
  end

  def destroy
    @deal.destroy
    redirect_to deals_path, notice: t('deals.cancel.success')
  end

  private

  def deal_params
    params.require(:deal).permit(
        :title,
        :description,
        :responsible_user,
        :responsible_account,
        business_attributes: [:name,:phone,:email,:url,:address,:city]
    )
  end

end
