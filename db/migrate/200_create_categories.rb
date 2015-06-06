class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nom
      t.string :question

      t.timestamps null: false
    end
  end
end
