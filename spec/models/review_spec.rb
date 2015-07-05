require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :restaurant }
  it { should validate_presence_of :rating }
  it { should validate_numericality_of(:rating).only_integer
       .is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
       .with_message("can only be a whole number between 1 and 5") }
end
