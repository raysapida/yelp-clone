class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :address, :phone, :website
end
