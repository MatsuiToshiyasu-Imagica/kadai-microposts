class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorite_relationships
  has_many :likes, through: :favorite_relationships, source: :microposts
  
  def likes(other_micropost)
    unless self == other_micropost
      self.favorite_relationships.find_or_create_by(micropot_id: other_user.id)
    end
  end

  def unlikes(other_micropost)
    favorite_relationship = self.favorite_relationships.find_by(micropost_id: other_user.id)
    favorite_relationship.destroy if favorite_relationship
  end
  
  validates :content, presence: true, length: { maximum: 255 }
end
