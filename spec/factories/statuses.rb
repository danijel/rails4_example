# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :status do
    user
    status Faker::Lorem.sentence
  end
end
