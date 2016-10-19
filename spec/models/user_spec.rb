require 'rails_helper'

RSpec.describe User, type: :model do
  context "when creating" do
    def it_should_not_save(user)
      user.save
      expect(User.count).to_not eq 1
    end

    it "should not create a new record without first_name" do
      user = FactoryGirl.build(:user, first_name: '')
      it_should_not_save(user)
    end

    it "should not create a new record without last_name" do
      user = FactoryGirl.build(:user, last_name: '')
      it_should_not_save(user)
    end

    it "should not create a new record without email" do
      user = FactoryGirl.build(:user, email: '')
      it_should_not_save(user)
    end

    it "should not create a new record without password" do
      user = FactoryGirl.build(:user, password: '')
      it_should_not_save(user)
    end

    it "should not create a new record without password confirmation" do
      user = FactoryGirl.build(:user, password_confirmation: '')
      it_should_not_save(user)
    end

    it "should not create a new record with wrong email format" do
      user=FactoryGirl.build(:user, email:'asdkl')
      it_should_not_save(user)
    end

    it "should not create a new record with a password to short" do
      user=FactoryGirl.build(:user, password:'secret')
      it_should_not_save(user)
    end
    it 'should create a user with correct attributes' do
      user = FactoryGirl.create(:user)
      expect(User.count).to eq 1
    end
  end
end
