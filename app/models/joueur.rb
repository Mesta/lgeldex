class Joueur < ActiveRecord::Base

  # Les suppressions en cascades sont gérées grâce aux clés étrangères
  has_many :joueur_modes
  has_many :modes, :through => :joueur_modes

  validates_presence_of :pseudo
end
