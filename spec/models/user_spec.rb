require 'rails_helper'

RSpec.describe User, type: :model do

  it 'will create a user with correct parametters' do
    user = FactoryGirl.create(:user)
    expect(User.count).to eq 1
  end

  context "with wrong parametters" do
    def it_should_not_save(user)
      user.save
      expect(User.count).to_not eq 1
    end

    it "will not create a user without first_name" do
      user = FactoryGirl.build(:user, first_name: '')
      it_should_not_save(user)
    end

    it "will not create a user without last_name" do
      user = FactoryGirl.build(:user, last_name: '')
      it_should_not_save(user)
    end

    it "will not create a user without email" do
      user = FactoryGirl.build(:user, email: '')
      it_should_not_save(user)
    end

    it "will not create a user without password" do
      user = FactoryGirl.build(:user, password: '')
      it_should_not_save(user)
    end

    it "will not create a user without password confirmation" do
      user = FactoryGirl.build(:user, password_confirmation: '')
      it_should_not_save(user)
    end

    it "will not create a user with wrong email format" do
      user=FactoryGirl.build(:user, email:'asdkl')
      it_should_not_save(user)
    end

    it "will not create a user with a password too short" do
      user=FactoryGirl.build(:user, password:'secret')
      it_should_not_save(user)
    end
  end

  context "given a user" do
    let(:user){FactoryGirl.build(:user)}
      it "Should return user's full name" do
        expect(user.full_name).to eq "Pedro Fernandez"
      end
  end


end
