FactoryGirl.define do
  factory :user do
    first_name 'Austin'
    last_name  'Turner'
    sequence(:email) { |n| "email#{n}@gmail.com"}
    password 'pw'
  end
end
