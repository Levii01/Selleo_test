require 'factory_girl_rails'
require 'faker'

puts "Seed: start"

20.times do
  FactoryGirl.create :user
end

puts "Seed: finish"
