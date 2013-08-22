FactoryGirl.define do
  factory :petition do
    title "My Title"
    description "My Description"
    association :user
  end

  factory :user do
    email "example@example.com"
    password "password"
    password_confirmation "password"
  end
end
