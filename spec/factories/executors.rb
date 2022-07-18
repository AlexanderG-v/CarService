FactoryBot.define do
  factory :executor do
    name { "MyString" }

    trait :invalid do
      name { nil }
    end
  end
end
