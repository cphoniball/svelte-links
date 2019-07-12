FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "Chris #{n}" }
    sequence(:email) { |n| "chris-#{n}@foobar.com" }
    password_digest { "testing password hash here" } # TODO: Put this in once we have bcrypt/etc.
  end

  factory :link_page do
    user
    sequence(:name) { |n| "Test Link Page #{n}" }
  end
end
