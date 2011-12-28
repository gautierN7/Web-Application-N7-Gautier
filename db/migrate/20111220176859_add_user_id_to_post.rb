class AddUserIdToPost < ActiveRecord::Migration
    def change
        add_column :posts, :user_id, :integer # ajout de la colonne dans Post user_id de type integer
    end
end
