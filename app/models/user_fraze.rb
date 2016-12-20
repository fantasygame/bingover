class UserFraze < ApplicationRecord
  belongs_to :user
  belongs_to :fraze
end
