class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def index
    @post = Post.new
    @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 5)
                                          .order(created_at: :desc)
  end

  def landing
  end
end
