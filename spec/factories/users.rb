FactoryGirl.define do
  factory :user do
    first_name 'Austin'
    last_name  'Turner'
    sequence(:email) { |n| "email#{n}@gmail.com"}
    password 'password'

    trait :confirmed do
      confirmed_at Time.now
    end
  end
end
