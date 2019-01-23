class BooksController < ApplicationController
  before_action :require_user_logged_in
  def new
    @books = []

    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Books::Book.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
  end
  
  private

  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    book_url = result['mediumImageUrl']

    {
      code: code,
      name: name,
      url: url,
      book_url: book_url,
    }
  end
  
end
