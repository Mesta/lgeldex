class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.string :nom

      t.timestamps null: false
    end
  end
end
