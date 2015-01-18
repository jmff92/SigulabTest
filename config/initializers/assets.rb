# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( bootstrap-dropdown.js )

Rails.application.config.assets.precompile += %w( bootlayout.css )
Rails.application.config.assets.precompile += %w( bootlayout.js )
Rails.application.config.assets.precompile += %w( jquery-ui-1.10.3.custom.css )

Rails.application.config.assets.precompile += %w( demo_page.css )
Rails.application.config.assets.precompile += %w( demo_table_jui.css )
Rails.application.config.assets.precompile += %w( examples_support/themes/smoothness/jquery-ui-1.8.4.custom.css )
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.js )
Rails.application.config.assets.precompile += %w( tabla.js )
