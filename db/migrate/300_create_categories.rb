class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nom
      t.string :question
      t.boolean :is_serious, default: false

      t.timestamps null: false
    end
  end
end
