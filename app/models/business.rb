class Business < ActiveRecord::Base

  attr_accessible :name, :address, :url, :phone, :email, :began_on, :ends_on

  validates_presence_of :name

  has_many :deals, dependent: :destroy

end
