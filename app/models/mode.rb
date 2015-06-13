class Mode < ActiveRecord::Base
  has_many :joueur_modes, dependent: :destroy
  has_many :joueurs, :through => :joueur_modes

  has_many :joueur_modes, dependent: :destroy
  has_many :categories, :through => :joueur_modes

  def nom_without_space
     return self.nom.gsub(/\s+/, "-")
  end
end
