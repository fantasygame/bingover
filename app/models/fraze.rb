class Fraze < ApplicationRecord
  has_many :user_frazes
  has_many :users, through: :user_frazes
end
