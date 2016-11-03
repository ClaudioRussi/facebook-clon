require 'rails_helper'

RSpec.feature "UserCanComments", type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user){FactoryGirl.create(:user,first_name:'Pablo',last_name:'Fernandez',email:'pablitofernandez@example.com')}
  let(:post){FactoryGirl.create(:post)}
  let(:attr){FactoryGirl.attributes_for(:comment)}
  context "When commenting" do
    scenario "With valid attr" do
      sign_in user
      visit post_path(post)
      fill_in 'Body', with: attr[:body]

      click_button "Comment"
      expect(page).to have_text attr[:body]
      expect(Comment.count).to eq 1
      expect(page).to have_text attr[:bodt]
    end

    scenario "With invalid attr" do
      sign_in user
      visit post_path(post)
      click_button "Comment"
      expect(page).to have_text("Body can't be blank")
      expect(post.comments.count).to eq 0
    end
  end
end
