FactoryGirl.define do
  factory :comment do
    comment 'Awesome comment'
    time    DateTime.now

    commentable_type
    commentable_id
    user
  end
end
