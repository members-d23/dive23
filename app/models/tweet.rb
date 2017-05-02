class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :content, presence: true, length: { in: 1..140}

  def createfavorite!(user_id)
    favorites.create!(user_id: user_id)
  end

  def isfavorite?(user_id)
    favorites.find_by(user_id: user_id)
  end

  def destroyfavorite!(user_id)
    favorites.find_by(user_id: user_id).destroy
  end
  
end
