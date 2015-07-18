# -*- encoding : utf-8 -*-
class CreateSuggestionModes < ActiveRecord::Migration
  def change
    create_table :suggestion_modes do |t|
      t.integer :suggestion_id, null: false
      t.integer :mode_id      , null: false

    end
    add_foreign_key :suggestion_modes, :suggestions , on_delete: :cascade
    add_foreign_key :suggestion_modes, :modes   , on_delete: :cascade
  end
end
