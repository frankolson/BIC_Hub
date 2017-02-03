class Event < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

  belongs_to :user

  validates_presence_of :name
  validates_presence_of :time
  validates_presence_of :user

  acts_as_votable
  acts_as_commentable

end
