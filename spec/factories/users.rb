FactoryGirl.define do
  factory :user do
    email { "jogn.doe@example.com".downcase }
    password "password"
  end
end
