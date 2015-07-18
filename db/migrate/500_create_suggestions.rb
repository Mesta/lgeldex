# -*- encoding : utf-8 -*-
class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :pseudo, null: false, uniqueness: true
      t.integer :nb_vote, default: 0

      t.timestamps null: false
    end
  end
end
