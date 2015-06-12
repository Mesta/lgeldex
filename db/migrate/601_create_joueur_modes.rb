class CreateJoueurModes < ActiveRecord::Migration
  def change
    create_table :joueur_modes do |t|
      t.integer :joueur_id
      t.integer :mode_id
    end
  end
end
