require 'rails_helper'

RSpec.feature "UserCanSeeFriendsPosts", type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user1){FactoryGirl.create(:sender)}
  let(:user2){FactoryGirl.create(:receiver, first_name:'Pablo', email:'pablo@example.com')}


  scenario "User can see friend's posts" do
    frienship = FactoryGirl.create(:friendship, friend: user1, user: user2 )
    post = FactoryGirl.create(:post, author: user1)
    sign_in user2
    visit '/'
    expect(page).to have_text post.body
  end
end
