class User < ApplicationRecord
  has_many :interests
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
