FactoryBot.define do
  factory :category do
    title { "MyString" }

    trait :invalid do
      title { nil }
    end
  end
end
