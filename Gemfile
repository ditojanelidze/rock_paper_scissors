source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

gem 'annotate'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rest-client'
gem 'rswag'

group :development, :test do
  gem 'dotenv-rails'
  gem 'rubocop-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'webmock'
end