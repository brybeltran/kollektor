FactoryBot.define do
  factory :link do
    association :page
    href        { "https://www.koombea.com/our-work/" }
    label { "Our Work" }
  end
end
