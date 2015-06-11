class AddSerious < ActiveRecord::Migration
  def change
    change_table  :categories do |t|
      t.boolean :is_serious, default: false
    end
  end
end
