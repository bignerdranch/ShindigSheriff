FactoryGirl.define do

  factory :user do
    sequence(:first_name)  { |num| "testuser firstname#{num}" }
    sequence(:last_name)  { |num| "testuser lastname#{num}" }
    sequence(:email)  { |num|"test@testuser#{num}.com" }
    password      'password123'
    phone_number  '111-111-1111'
  end

  factory :organization do
    name          'Rails Girls'
    website       'www.railsgirlsforevermeetup.com'
  end

  factory :event do
    sequence(:name)  { |num| "event_name_#{num}" }
    date           'Jan 20, 2020'
    time           Time.new
    location      'Burj Khalifa'
    purpose       'Rails Girls tutorial walk-through'
  end

end

