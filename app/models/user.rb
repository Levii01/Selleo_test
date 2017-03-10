class User < ApplicationRecord
  has_many :interests
  before_save :nil_gender

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nil_gender
    self.gender = 'Not defined' if self.gender.nil?
  end

  validates_inclusion_of :gender, in: ['Male', 'Famale', nil]
end
