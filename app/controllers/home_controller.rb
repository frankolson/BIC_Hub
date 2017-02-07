class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def index
    @post = Post.new
    @friends = current_user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(owner_id: @friends)
                                          .paginate(:page => params[:page], :per_page => 5)
                                          .order(created_at: :desc)
  end

  def landing
  end
end
