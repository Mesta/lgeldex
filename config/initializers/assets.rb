# -*- encoding : utf-8 -*-
# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( analytics.js )

Rails.application.config.assets.precompile += %w( versus.css )

Rails.application.config.assets.precompile += %w( suggestions.css )
Rails.application.config.assets.precompile += %w( suggestions.js )

Rails.application.config.assets.precompile += %w( joueurs.css )
Rails.application.config.assets.precompile += %w( joueurs.js )

Rails.application.config.assets.precompile += %w( administrateurs.css )
Rails.application.config.assets.precompile += %w( administrateurs.js )

Rails.application.config.assets.precompile += %w( categories.css )
Rails.application.config.assets.precompile += %w( categories.js )

Rails.application.config.assets.precompile += %w( modes.css )
Rails.application.config.assets.precompile += %w( modes.js )