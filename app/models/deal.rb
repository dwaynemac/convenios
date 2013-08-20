class Deal < ActiveRecord::Base

  attr_accessible :title, :description, :responsible_user, :business_id, :business_attributes, :began_on, :ends_on

  validates_presence_of :business
  belongs_to :business
  accepts_nested_attributes_for :business

  validates_presence_of :responsible_user
  validates_presence_of :title

  before_create :set_began_on

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
        title: title,
        description: description,
        business: {
            name: business.name,
            address: business.address
        }
    }
  end

  private

  def set_began_on
    if began_on.nil?
      self.began_on = Date.today
    end
  end

end
