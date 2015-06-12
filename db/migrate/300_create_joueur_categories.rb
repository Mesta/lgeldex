class CreateJoueurCategories < ActiveRecord::Migration
  def change
    create_table :joueur_categories do |t|
      t.integer :joueur_mode_id
      t.integer :category_id

      t.integer :elo

      t.timestamps null: false
    end
  end
end
