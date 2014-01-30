FactoryGirl.define do

  factory :user do
    sequence(:first_name)  { |num| "testuser firstname#{num}" }
    sequence(:last_name)  { |num| "testuser lastname#{num}" }
    sequence(:email)  { |num|"test@testuser#{num}.com" }
    password      'password123'
    phone_number  '111-111-1111'
    verified true

    trait :not_verified do
      verified false
    end
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

  factory :income do
    estimated_amount '10.00'
    actual_amount    '10.00'
    status           nil
    category_details 'things' 
    event
    association :category
  end

  factory :expense do
    estimated_amount '10.01'
    actual_amount    '10.02'
    status           nil
    category_details 'things' 
    event
  end

  factory :role do 
    name "organizer"

    trait :as_finance_approver do 
      name "finance approver"
    end
  end

  factory :category do
    name "Swag"
  end
end

