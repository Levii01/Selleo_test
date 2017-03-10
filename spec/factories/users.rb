FactoryGirl.define do
  factory :user do
    sequence :email do |n|
    "user#{n}@gmail.com"
    end
    password { 'secret' }
    age { rand(30)+12 }
    gender { rand(2).zero? ? 'Male' : 'Famale' }
  end
end
