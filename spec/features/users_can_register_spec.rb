require 'rails_helper'

RSpec.feature "UserCanRegister", type: :feature do
  context "With valid information" do
    scenario "Should create a user" do
      visit 'sign_up'
      fill_in 'First name', :with => "Pedro"
      fill_in 'Last name', with: 'Fernandez'
      fill_in 'Email', with: 'correo@example.com'
      fill_in 'Password', with: 'topsecret'
      fill_in 'Password confirmation', with: 'topsecret'
      click_button 'Sign up'
      expect(User.count).to eq 1
      expect(page).to have_text("You have signed up successfully.")
    end
  end
end
