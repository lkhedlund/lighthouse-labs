FactoryGirl.define do
  factory :library do
    name     Faker::Company.name
    late_fee 10
    capacity 5000
  end
end
