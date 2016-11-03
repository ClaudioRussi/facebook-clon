require 'rails_helper'

RSpec.feature "UserCanAcceptFriendRequests", type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user1){FactoryGirl.create(:sender)}
  let(:user2){FactoryGirl.create(:receiver, first_name: 'Pablo', email: 'pablo@example.com')}
  context "Accepting friend requests" do
    scenario "User can accept friend request" do
      @friend_request = FactoryGirl.create(:friend_request,sender:user1, receiver:user2, status:'Unconfirmed')
      sign_in user2
      visit user_path(user2)
      click_link 'Friend requests'
      expect(page).to have_text "#{user1.full_name}"
      click_button 'Confirm friend request'
      expect(user2.friendships.count).to eq 1
    end
  end
end
