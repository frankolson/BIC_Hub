class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :time
  validates_presence_of :user

end
