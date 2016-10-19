FactoryGirl.define do
  factory :user do
    first_name {'Pedro'}
    last_name {'Fernandez'}
    password {'topsecret'}
    password_confirmation {'topsecret'}
    email {'example@mail.com'}
  end
end
