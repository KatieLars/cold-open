class UserFreezer < ApplicationRecord
  belongs_to :user
  belongs_to :freezer
end
