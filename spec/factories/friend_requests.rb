FactoryGirl.define do
  factory :friend_request do
    sender
    receiver
    status {"Unconfirmed"}
  end
end
