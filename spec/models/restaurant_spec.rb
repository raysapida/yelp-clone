require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :address}
  it {should validate_presence_of :phone}
  it {should validate_presence_of :website}
  it {should have_many :reviews}
end
