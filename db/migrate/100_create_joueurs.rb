class CreateJoueurs < ActiveRecord::Migration
  def change
    create_table :joueurs do |t|
      t.string :pseudo
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
