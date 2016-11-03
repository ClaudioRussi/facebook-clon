class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.friend_posts.order(created_at: :desc)
  end
end
