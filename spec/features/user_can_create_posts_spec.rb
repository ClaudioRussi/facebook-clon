require 'rails_helper'

RSpec.feature "UserCanCreatePosts", type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user){FactoryGirl.create(:user)}
  let(:attr){FactoryGirl.attributes_for(:post)}
  context "Creating a post" do
    scenario "With valid params" do
      sign_in user
      visit new_post_path
      fill_in 'Body', with: attr[:body]
      click_button 'Create post'
      expect(Post.count).to eq 1
      expect(page).to have_text("Post successfully created!")
      expect(page).to have_text(attr[:body])
    end

    scenario "With invalid params" do
      sign_in user
      visit new_post_path
      click_button 'Create post'
      expect(Post.count).to eq 0
      expect(page).to have_text("Body can't be blank")
    end

    scenario "Not signed in" do
      visit new_post_path
      expect(page).to have_text("You need to sign in or sign up before continuing")
    end
  end
end
