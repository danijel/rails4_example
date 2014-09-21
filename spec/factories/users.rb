FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
