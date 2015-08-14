require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :address}
  it {should validate_presence_of :phone}
  it {should validate_presence_of :website}
  it {should validate_presence_of :image}
  it {should_not allow_value('12 456 7890').for(:phone)}
  it {should_not allow_value('example.com').for(:website)}
  it {should_not allow_value('123 Somewhere Street').for(:address)}

  it {should have_many :reviews}
end
