FactoryBot.define do
  factory :order do
    customer_name { "MyString" }

    trait :invalid do
      customer_name { nil }
    end
  end
end
