FactoryGirl.define do
  factory :comment do
    comment 'Awesome comment'

    user
  end
end
