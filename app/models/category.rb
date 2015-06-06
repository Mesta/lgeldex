class Category < ActiveRecord::Base

  has_many :joueur_categories, dependent: :destroy
  has_many :joueurs, :through => :joueur_categories

end
