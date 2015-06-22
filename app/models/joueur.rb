# -*- encoding : utf-8 -*-
class Joueur < ActiveRecord::Base

  # Les suppressions en cascades sont g?r?es gr?ce aux cl?s ?trang?res
  has_many :joueur_modes
  has_many :modes, :through => :joueur_modes

  validates_presence_of :pseudo
end
