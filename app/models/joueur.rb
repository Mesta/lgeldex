class Joueur < ActiveRecord::Base

  has_many :joueur_categories, dependent: :destroy
  has_many :categories, :through => :joueur_categories

end
