class JoueurMode < ActiveRecord::Base
  belongs_to :joueur
  belongs_to :mode

  validates_presence_of :joueur
  validates_presence_of :mode
end
