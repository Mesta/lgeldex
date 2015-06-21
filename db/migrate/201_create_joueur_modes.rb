# -*- encoding : utf-8 -*-
class CreateJoueurModes < ActiveRecord::Migration
  def change
    create_table :joueur_modes do |t|
      t.integer :joueur_id, null: false
      t.integer :mode_id, null: false

    end
    add_foreign_key :joueur_modes, :joueurs, on_delete: :cascade
    add_foreign_key :joueur_modes, :modes, on_delete: :cascade
  end
end
