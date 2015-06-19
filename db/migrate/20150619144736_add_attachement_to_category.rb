class AddAttachementToCategory < ActiveRecord::Migration
  def change

    add_attachment :categories, :icone
  end
end
