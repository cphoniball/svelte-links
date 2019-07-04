FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Chris #{n}" }
    sequence(:email) { |n| "chris-#{n}@foobar.com" }
    password_hash { "" } # TODO: Put this in once we have bcrypt/etc.
  end

  factory :link_page do
    user
    sequence(:name) { |n| "Test Link Page #{n}" }
  end
end
