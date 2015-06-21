# -*- encoding : utf-8 -*-
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nom,          null: false
      t.string :question,     null: false
      t.string :description,  null: true
      t.boolean :is_serious,  default: false
      t.timestamps            null: false
    end
  end
end
