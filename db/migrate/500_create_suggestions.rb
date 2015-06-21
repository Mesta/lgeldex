# -*- encoding : utf-8 -*-
class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :pseudo, null: false

      t.timestamps null: false
    end
  end
end
