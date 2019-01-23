class RemoveImageUrlToBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :image_url, :string
  end
end
