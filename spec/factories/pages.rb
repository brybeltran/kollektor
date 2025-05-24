FactoryBot.define do
  factory :page do
    association :user
    url { "https://www.koombea.com/" }
    title { "Koombea" }
    status { :pending }
  end
end
