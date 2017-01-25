class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def index
    @post = Post.new
  end

  def landing
  end
end
