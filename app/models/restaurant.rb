class Restaurant < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :reviews

  validates_presence_of :name, :address, :phone, :website, :image
  validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
                              message: "must be in the format (123) 456-7890" }
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
                                message: "must start with http:// or https://" }
  validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
                                message: "must be in the format 350 Fifth Avenue, New York, NY 10118" }
end
