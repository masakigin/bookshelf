class RemoveTypeToFavorites < ActiveRecord::Migration[5.0]
  def change
    remove_column :favorites, :type, :string
  end
end
