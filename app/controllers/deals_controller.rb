class DealsController < ApplicationController

  load_and_authorize_resource except: :my_federation

  respond_to :html

  def my_federation
    authorize! :read, Deal
    @deals = Deal.scoped

    nid = current_user.current_account.padma.nucleo_id # webservice call
    if nid
      s = NucleoClient::School.find(nid)                 # webservice call
      params[:federation_id] = s.federation_id
      index
    else
      redirect_to deals_path, alert: t('deals.index.couldnt_get_federation')
      return
    end
  end


  def index
    if params[:federation_id]
      @federation = NucleoClient::Federation.find(params[:federation_id])
      @deals = @deals.where(federation_id: @federation.id) if @federation
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
