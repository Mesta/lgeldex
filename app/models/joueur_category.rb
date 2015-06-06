class JoueurCategory < ActiveRecord::Base
  belongs_to :joueur
  belongs_to :category

  validates_presence_of :joueur
  validates_presence_of :category
  validates_presence_of :elo
end
