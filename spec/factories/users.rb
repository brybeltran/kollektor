FactoryBot.define do
  factory :user do
    sequence(:email)    { |n| "koombea_#{n}@example.com" }
    username            { "proban2" }
    password            { "fe-li-pe!" }
    password_confirmation { "fe-li-pe!" }
  end
end
