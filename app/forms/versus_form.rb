class VersusForm
  include ActiveModel::Model

  attr_accessor :categorie
  attr_accessor :joueurs
  attr_accessor :choix

  validates_presence_of :categorie
  validates_presence_of :joueurs
  # TODO define my self validation system : :choix in :joueurs

  def initialize(attributes = {})
    self.categorie  = Category.limit(1).order("rand()").first()
    self.joueurs         = Joueur.limit(2).where(is_active: true).order("rand()")


  end

  def register
    if valid?
      # TODO update elo
    end
  end

  private

  def create_user
    # ...
  end
end