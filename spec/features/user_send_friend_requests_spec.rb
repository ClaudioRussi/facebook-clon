require 'rails_helper'

RSpec.feature "UserSendFriendRequests", type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user){FactoryGirl.create(:user)}
  let(:user2){FactoryGirl.create(:user,first_name:'Pablo',last_name:'Fernandez',email:'pablitofernandez@example.com')}
  context "Sending a friend request" do
    scenario "User can send friend request" do
      sign_in user
      visit user_path(user2)
      click_button "Send friend request"
      expect(FriendRequest.count).to eq 1
    end

  end
end
