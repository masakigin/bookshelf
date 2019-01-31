class Book < ApplicationRecord
  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :book_url, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :users, through: :favorites

end
