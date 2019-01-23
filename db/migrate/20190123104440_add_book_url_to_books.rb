class AddBookUrlToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_url, :string
  end
end
