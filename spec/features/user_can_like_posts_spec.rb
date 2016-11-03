require 'rails_helper'

RSpec.feature "UserCanLikePosts", type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user2){FactoryGirl.create(:receiver, first_name:'Pablo', email:'pablo@example.com')}
  let(:user){FactoryGirl.create(:user)}

  scenario "User can like posts" do
    frienship = FactoryGirl.create(:friendship, friend: user, user: user2 )
    post = FactoryGirl.create(:post, author: user)
    sign_in user2
    visit root_path
    expect(page).to have_text(post.body)
    click_link "Like"
    expect(post.likers.count).to eq 1
    expect(page).to have_text('You liked this post')
  end

end
