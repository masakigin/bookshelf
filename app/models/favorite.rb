class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  def self.ranking
    self.group(:book_id).order('count_book_id DESC').limit(10).count(:book_id)
  end
end
