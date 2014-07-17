class Deal < ActiveRecord::Base

  attr_accessible :title,
                  :description,
                  :local_user_id,
                  :local_account_id,
                  :business_id,
                  :business_attributes

  belongs_to :user, foreign_key: :local_user_id
  validates_presence_of :user

  belongs_to :account, foreign_key: :local_account_id
  validates_presence_of :account

  validates_presence_of :business
  belongs_to :business
  accepts_nested_attributes_for :business

  validates_presence_of :title

  before_save :set_federation

  def self.query(query_string)
    if query_string.blank?
      self.scoped
    else
      query_string = "%#{query_string}%"
      business_ids = Business.where("name like ?",query_string).pluck(:id)
      self.scoped.where("business_id IN (:ids) OR title like :query OR description like :query",
                        {ids: business_ids, query: query_string})
    end
  end

  def as_json(args={})
    {
        id: id,
        title: title,
        description: description,
        business_name: business.name,
        business: {
            name: business.name,
            address: business.address,
            latitude: business.lat,
            longitude: business.lng
        }
    }
  end

  def responsible_user
    user.try :username
  end

  def responsible_account
    account.try :name
  end

  private

  def set_federation


    if federation_id.nil? && account.present?
      nid = account.padma.nucleo_id
      if nid
        s = NucleoClient::School.find(nid)
        if s
          self.federation_id = s.federation_id
        end
      end
    end

    if federation_id_changed?
      f = NucleoClient::Federation.find(federation_id)
      if f
        self.cached_federation_name= f.name
      else
        self.cached_federation_name= nil
      end
    end

  end

end
