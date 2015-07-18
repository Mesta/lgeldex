# -*- encoding : utf-8 -*-
class Joueur < ActiveRecord::Base

  has_many :joueur_modes
  has_many :modes, :through => :joueur_modes

  validates_presence_of :pseudo
end
