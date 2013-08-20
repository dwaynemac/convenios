class Business < ActiveRecord::Base

  attr_accessible :name, :address, :url, :phone, :email, :city

  validates_presence_of :name

  has_many :deals, dependent: :destroy

end
