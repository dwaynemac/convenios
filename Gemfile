source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.0.0'

gem 'figaro'

gem 'cancan'
gem 'protected_attributes' # Rails 4 support for Mass Assignment Security
gem 'devise', github: 'plataformatec/devise', branch: 'rails4'
gem 'devise_cas_authenticatable'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'

# Inplace editor
gem 'best_in_place', github: 'afalkear/best_in_place_post'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'
gem 'formtastic'
gem 'formtastic-bootstrap'

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
  #gem 'subcontractor', '~> 0.6.1'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  gem 'sdoc', require: false
  gem 'yard', '~> 0.8.3'
  gem 'yard-restful'
end
