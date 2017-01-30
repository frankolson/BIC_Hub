class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :events
  has_many :comments

  acts_as_voter

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  mount_uploader :profile_pic,  PictureUploader
  mount_uploader :timeline_pic, PictureUploader

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
