FactoryGirl.define do
  factory :interest do
    user { FactoryGirl.create(:user) }
    name { 'Video games' }
  end
end
