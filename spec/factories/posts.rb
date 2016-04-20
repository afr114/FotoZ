FactoryGirl.define do
  factory :post do
    user_id 1
    caption "nofilter"
    image { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/coffee.jpg', 'image/jpg') }
  end
end
