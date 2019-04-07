class Friend < ApplicationRecord
  belongs_to :member
  belongs_to :friend_member
end
