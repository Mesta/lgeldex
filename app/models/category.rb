class Category < ActiveRecord::Base
  has_many :joueur_modes_category, dependent: :destroy
  has_many :joueur_modes, :through => :joueur_modes_category
end
