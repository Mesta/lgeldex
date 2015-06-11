class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def accueil
  end

  def classements
    @classements = Array.new
    categories = Category.all
    categories.each do |category|
      @classements.push(JoueurCategory.where(category_id: category.id).order(elo: :DESC).first(60))
    end
  end

  def about
  end
end
