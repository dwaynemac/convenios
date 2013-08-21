source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'rails_12factor', group: :production

gem 'cancan'
gem 'protected_attributes' # Rails 4 support for Mass Assignment Security
gem 'devise', github: 'plataformatec/devise', :branch => 'rails4'
gem 'devise_cas_authenticatable'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'

gem 'accounts_client', '~> 0.0.19'
gem 'nucleo_client', '~> 0.0.3'

group :development, :test do
  gem 'sqlite3'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'foreman'
  gem 'subcontractor', '~> 0.6.1'
end

group :production do
  gem 'pg'
  gem 'rails_log_stdout',           git: 'git://github.com/heroku/rails_log_stdout.git'
  gem 'rails3_serve_static_assets', git: 'git://github.com/heroku/rails3_serve_static_assets.git'
end

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', require: false
  gem 'yard', '~> 0.8.3'
  gem 'yard-restful'
end
