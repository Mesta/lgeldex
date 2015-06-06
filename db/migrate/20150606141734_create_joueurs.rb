class CreateJoueurs < ActiveRecord::Migration
  def change
    create_table :joueurs do |t|

      t.timestamps null: false
    end
  end
end
