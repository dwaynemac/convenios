class Deal < ActiveRecord::Base

  attr_accessible :title, :description, :responsible_user, :business_id, :business_attributes

  validates_presence_of :business
  belongs_to :business
  accepts_nested_attributes_for :business

  validates_presence_of :responsible_user
  validates_presence_of :title

end
