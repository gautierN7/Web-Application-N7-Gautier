class AddPostIdToComment < ActiveRecord::Migration
  def change
	add_column :comments, :post_id, :integer #ajout de la colonne dans comments, post_id de type integer
  end
end
