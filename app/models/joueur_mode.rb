class JoueurMode < ActiveRecord::Base
  after_create :create_joueur_modes_categories

  belongs_to :joueur
  belongs_to :mode

  # Les suppressions en cascades sont gérées grâce aux clés étrangères
  has_many :joueur_modes_categories
  has_many :categories, :through => :joueur_modes_categories

  validates_presence_of :joueur
  validates_presence_of :mode

  def create_joueur_modes_categories
    Category.all.each do |category|
      JoueurModesCategory.create joueur_mode: self, category: category, elo: 1200
    end
  end

end
