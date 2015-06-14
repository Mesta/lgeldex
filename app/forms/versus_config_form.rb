class VersusConfigForm
  include ActiveModel::Model
  require 'active_support'

  attr_accessor :is_serious
  attr_accessor :mode

  validates_presence_of :is_serious

  def initialize(serious = false)
    self.is_serious = serious
  end

  def update(params)
    retour = false;
    if params.has_key? :is_serious
      if params["is_serious"] == "0"
        self.is_serious = false
      else
        self.is_serious = true
      end
      retour = true
    end

    if params.has_key? :is_serious
      if params["mode"].blank?
        retour = false
      else
        self.mode = params["mode"]
      end
      retour = true
    end
    return retour

  else
    return false
  end
end
