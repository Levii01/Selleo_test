FactoryGirl.define do
  factory :interest do
    user { FactoryGirl.create(:user) }
    name { 'Wideo Game' }
  end
end
