FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Chris #{n}" }
    sequence(:email) { |n| "chris-#{n}@foobar.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :link_page do
    user
    sequence(:name) { |n| "Test Link Page #{n}" }
  end
end
