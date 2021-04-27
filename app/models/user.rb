class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true
  validates :age, presence: true
  validates :mail, presence: true
  validates :password, presence: true
  validates_length_of :password, within: 6..20, on: :create, too_long: "pick a shorter password", too_short: "pick a longer password"
end
