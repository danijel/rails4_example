FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) do |n|
      email = Faker::Internet.email
      at_index = email.index("@")
      email[at_index+1] = n.to_s
      email
    end
    password { Faker::Internet.password(8) }

    trait :admin do
      role 'admin'
    end

  end
end