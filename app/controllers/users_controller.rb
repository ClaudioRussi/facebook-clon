class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def create_friend_request
    request = FriendRequest.new(sender_id: current_user.id, receiver_id: params[:id])
    if request.save
      flash[:notice] = "You have sent a friend request"
    end
    redirect_to user_path(params[:id])
  end

  def received_friend_requests
    @requests = current_user.received_friend_requests.where(status: 'Unconfirmed')
  end
end
