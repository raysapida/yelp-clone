class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :address, :phone, :website

  mount_uploader :image, ImageUploader

  has_many :reviews
end
