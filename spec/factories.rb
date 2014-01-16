FactoryGirl.define do

  factory :user do
    first_name    'testuser firstname'
    last_name     'testuser lastname'
    email         'test@testuser123.com'
    password      'password123'
    phone_number  '111-111-1111'
  end

  factory :organization do
    user
    name          'Rails Girls'
    website       'www.railsgirlsforevermeetup.com'
  end

  factory :event do
    organization
    name          'Getting Started'
    date           2100-11-01
    time           Time.new
    location      'Burj Khalifa'
    purpose       'Rails Girls tutorial walk-through'
  end

end