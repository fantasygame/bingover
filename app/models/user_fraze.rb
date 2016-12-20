class UserFraze < ApplicationRecord
  belongs_to :user
  belongs_to :fraze
  validates :user, :fraze, presence: true
end
