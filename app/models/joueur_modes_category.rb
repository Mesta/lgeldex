# -*- encoding : utf-8 -*-
class JoueurModesCategory < ActiveRecord::Base
  belongs_to :joueur_mode
  belongs_to :category

  validates_presence_of :joueur_mode
  validates_presence_of :category
  validates_presence_of :elo
end
