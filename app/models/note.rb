class Note < ApplicationRecord
  belongs_to :user #wired
  belongs_to :item #wired
end
