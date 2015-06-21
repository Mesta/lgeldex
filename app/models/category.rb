# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :joueur_modes_category, dependent: :destroy
  has_many :joueur_modes, :through => :joueur_modes_category

  has_attached_file :icone, :styles => { :icone => "60x60" }

  validates_presence_of :nom, :question
  validates_attachment_content_type :icone, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
