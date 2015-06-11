class VersusConfigForm
  include ActiveModel::Model
  require 'active_support'

  attr_accessor :is_serious

  validates_presence_of :is_serious

  def initialize(serious = false)
    self.is_serious = serious
  end

  def update(params)
    if params.has_key? :is_serious
      if (params["is_serious"] == "1")
        self.is_serious = true
      else
        self.is_serious = false
      end
    end
    return true

  else
    return false
  end
end
