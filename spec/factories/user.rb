FactoryGirl.define do
  sequence(:email) {|n| "email#{n}@brandymint.com" }
  factory :user do
    email  { generate :email } 
    password              "password"
    password_confirmation "password"
  end
end
