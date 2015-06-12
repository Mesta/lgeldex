class Mode < ActiveRecord::Base
  has_many :joueur_modes, dependent: :destroy
  has_many :joueurs, :through => :joueur_modes
end
