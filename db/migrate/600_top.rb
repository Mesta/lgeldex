class Top < ActiveRecord::Migration
  def change
    create_table :tops do |t|
      t.integer :rang, null: false
      t.integer :joueur_id, null: false
      t.integer :mode_id, null: false
      t.float   :elo, null: false

      t.timestamps null: false
    end
  end
end
