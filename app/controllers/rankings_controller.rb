class RankingsController < ApplicationController
  def favorite
    @ranking_counts = Favorite.ranking
    @books = Book.find(@ranking_counts.keys)
  end
end
