FactoryGirl.define do
  factory :review do
    association :restaurant, factory: :restaurant
    association :user, factory: :user
    rating 1
    comment "MyText"
  end

end
