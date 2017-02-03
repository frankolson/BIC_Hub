class Post < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:create, :like], owner: proc { |_controller, model| model.user }

  mount_uploader :attachment, PictureUploader

  belongs_to :user

  validates_presence_of :content
  validates_presence_of :user

  acts_as_votable
  acts_as_commentable
end
