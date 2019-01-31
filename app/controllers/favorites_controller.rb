class FavoritesController < ApplicationController
  def create
    @book = Book.find_or_initialize_by(code: params[:book_code])

    unless @book.persisted?

      results = RakutenWebService::Books::Book.search(isbn: @book.code)

      @book = Book.new(read(results.first))
      @book.save
    end


    current_user.favorite(@book)
    flash[:success] = '本をお気に入りしました。'


    redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])

    current_user.unfavorite(@book) 
    flash[:success] = '本のお気に入りを解除しました。'

    redirect_back(fallback_location: root_path)
  end
end
