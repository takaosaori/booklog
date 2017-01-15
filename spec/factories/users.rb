FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "test #{n}" }
    sequence(:email) { |n| "user#{n}@test2.com" }
    password "testtesttest"
    password_confirmation "testtesttest"
    agreement '1'
  end
end