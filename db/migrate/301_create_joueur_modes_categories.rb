# -*- encoding : utf-8 -*-
class CreateJoueurModesCategories < ActiveRecord::Migration
  def change
    create_table :joueur_modes_categories do |t|
      t.integer :joueur_mode_id, null: false
      t.integer :category_id, null: false

      t.integer :elo

      t.timestamps null: false
    end

    add_foreign_key :joueur_modes_categories, :joueur_modes, on_delete: :cascade
    add_foreign_key :joueur_modes_categories, :categories, on_delete: :cascade
  end
end
