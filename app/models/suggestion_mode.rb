# -*- encoding : utf-8 -*-
class SuggestionMode < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :mode

  validates_presence_of :suggestion
  validates_presence_of :mode
end
