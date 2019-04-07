class Friend < ApplicationRecord
  alias_attribute :friend_name, :friend_member_id

  belongs_to :member, inverse_of: :friends, foreign_key: :member_id
  belongs_to :friend_member, class_name: "Member", inverse_of: :friend_members, foreign_key: :friend_member_id

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { friend_member_id: member_id, member_id: friend_member_id }
  end
end