require 'rails_helper'

RSpec.feature "UserCanLogIns", type: :feature do
  let(:user) {FactoryGirl.create(:user)}
  context "With valid information" do
    scenario "should log in" do
      visit 'sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_text("Signed in successfully")
    end
  end
end
