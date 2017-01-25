class Post < ApplicationRecord
  mount_uploader :attachment, PictureUploader

  belongs_to :user

  validates_presence_of :content
  validates_presence_of :user

  acts_as_votable
end
