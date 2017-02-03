class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def index
    @post = Post.new
    @activities = PublicActivity::Activity.all.order(created_at: :desc)
  end

  def landing
  end
end
