FactoryBot.define do
  factory :goal do
    name { "MyString" }
    timeframe { "2023-02-12 21:36:46" }
    exp { 1 }
    ended { false }
    user { nil }
  end
end
