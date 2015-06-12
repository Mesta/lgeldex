class Joueur < ActiveRecord::Base

  has_many :joueur_modes, dependent: :destroy
  has_many :modes, :through => :joueur_modes

end
