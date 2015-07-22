FactoryGirl.define do
  factory :restaurant do
    name 'Example'
    phone '(123) 456-7890'
    address '111 Example Street, City, ST 12345'
    website 'http://example.com'
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/rails.png", 'image/png')
  end

end
