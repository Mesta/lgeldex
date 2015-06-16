class Mode < ActiveRecord::Base
  has_many :joueur_modes, dependent: :destroy
  has_many :joueurs, :through => :joueur_modes

  has_many :joueur_modes, dependent: :destroy
  has_many :categories, :through => :joueur_modes

  validates_presence_of :nom

  def nom_without_space
     return self.nom.gsub(/\s+/, "-")
  end
end
