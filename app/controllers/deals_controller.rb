class DealsController < ApplicationController

  load_and_authorize_resource

  respond_to :html

  def index
    # TODO make less w.s. calls
    nid = current_user.current_account.padma.nucleo_id # webservice call
    if nid
      s = NucleoClient::School.find(nid)                 # webservice call
      @federation = s.federation                         # webservice call
      @deals = @deals.where(federation_id: @federation.id)
    end

    @query = params[:q]

    @deals = @deals.query(@query).all
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
        :local_user_id,
        :local_account_id,
        business_attributes: [:name,:phone,:email,:url,:address,:city]
    )
  end

end
