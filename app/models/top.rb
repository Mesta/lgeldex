# -*- encoding : utf-8 -*-
class Top < ActiveRecord::Base
  has_one :joueur
  has_one :mode
end
