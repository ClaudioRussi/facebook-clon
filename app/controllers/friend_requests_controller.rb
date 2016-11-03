class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  def create
    request = FriendRequest.new(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
    if request.save
      flash[:notice] = "You have sent a frienship request"
    end
    redirect_to user_path(params[:receiver_id])
  end

  def confirm
    User.find(params[:id]).friendships.build(friend_id: current_user.id).save
    User.find(current_user.id).friendships.build(friend_id: params[:id]).save
    redirect_to root_path
  end
end
