class VersusForm
  include ActiveModel::Model
  require 'active_support'

  attr_accessor :categorie
  attr_accessor :joueur_1
  attr_accessor :joueur_2
  attr_accessor :choix

  attr_accessor :is_serious
  attr_accessor :mode

  validates_presence_of :categorie
  validates_presence_of :joueurs

  def initialize(is_serious, mode)
    self.is_serious = is_serious
    self.mode = mode
  end

  def config(categorie = nil, joueurs = {})

    if categorie.nil?
      if self.is_serious
        self.categorie = Category.where(is_serious: self.is_serious).order("rand()").first()
      else
        self.categorie = Category.order("rand()").first()
      end

    else
      self.categorie = Category.find(categorie)
    end

    if joueurs.empty?
      joueurs = JoueurMode.where(mode: self.mode).order("rand()").first(2)
      self.joueur_1 = Joueur.where(id: joueurs[0].joueur_id).first()
      self.joueur_2 = Joueur.where(id: joueurs[1].joueur_id).first()

    else
      self.joueur_1 = Joueur.find(joueurs[0])
      self.joueur_2 = Joueur.find(joueurs[1])
    end
  end

  def update(params)
    if params.has_key? :choix
      self.choix = Integer(params["choix"])

      if self.is_valid?
        return update_elo()
      else
        return false
      end

    else
      return false
    end
  end

  def is_valid?
    retour = false
    if [self.joueur_1.id, self.joueur_2.id].include? self.choix
      retour = true
    else
      retour = false
    end
    return retour
  end

  def update_elo
    # Get elo score for the current categorie & players
    jm1 = JoueurMode.where(joueur_id: joueur_1.id, mode: self.mode).first
    jm2 = JoueurMode.where(joueur_id: joueur_2.id, mode: self.mode).first

    jc1 = JoueurModesCategory.where(joueur_mode_id: jm1.id, category_id: categorie.id).first
    jc2 = JoueurModesCategory.where(joueur_mode_id: jm2.id, category_id: categorie.id).first

    elo_joueur_1 = jc1.elo
    elo_joueur_2 = jc2.elo

    #Calculate estimations
    exp = (elo_joueur_2 - elo_joueur_1) / 400
    estimation_1 = 1 / (1 + 10 ** exp)

    exp = (elo_joueur_1 - elo_joueur_2) / 400
    estimation_2 = 1 / (1 + 10 ** exp)

    #Calculate new elo score depending who the vote gone for
    if (self.choix == self.joueur_1.id)
      var_1 = getK(elo_joueur_1) * (1 - estimation_1)
      var_2 = getK(elo_joueur_2) * (0 - estimation_2)
      if var_1 > 25
        var_1 = 25
      end

      if var_2 > 25
        var_2 = 25
      end

      elo_joueur_1 = elo_joueur_1 + var_1
      elo_joueur_2 = elo_joueur_2 + var_2
    else
      var_1 = getK(elo_joueur_1) * (0 - estimation_1)
      var_2 = getK(elo_joueur_2) * (1 - estimation_2)
      if var_1 > 25
        var_1 = 25
      end

      if var_2 > 25
        var_2 = 25
      end
      elo_joueur_1 = elo_joueur_1 + var_1
      elo_joueur_2 = elo_joueur_2 + var_2
    end

    # Update elo score in database
    jc1.elo = elo_joueur_1
    jc2.elo = elo_joueur_2

    if jc1.save and jc2.save
      return true
    else
      return false
    end
  end

  def getK elo
    if elo < 1000
      return 80
    elsif elo < 2000
      return 50
    elsif elo < 2400
      return 30
    else
      return 20
    end
  end

end
