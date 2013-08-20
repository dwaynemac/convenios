class DealsController < ApplicationController

  def index
    @deals = Deal.all
    respond_to do |format|
      format.html
      format.json
    end
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

  private

  def deal_params
    params.require(:deal).permit(
        :title,
        :description,
        :responsible_user,
        business_attributes: [:name,:phone,:email,:url,:address]
    )
  end

end
