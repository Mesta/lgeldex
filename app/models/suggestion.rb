# -*- encoding : utf-8 -*-
class Suggestion < ActiveRecord::Base
  has_many :suggestion_modes
  has_many :modes, :through => :suggestion_modes
end
