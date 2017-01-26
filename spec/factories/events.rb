FactoryGirl.define do
  factory :event do
    name    'Awesome event'
    time    DateTime.now

    user
  end
end
