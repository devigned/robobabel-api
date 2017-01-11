source 'https://rubygems.org'

ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails',                '~> 5.0'
gem 'puma',                 '~> 3.0'
gem 'pg',                   '~> 0.19'
gem 'bcrypt',               '~> 3.1'
gem 'omniauth',             '~> 1.3'
gem 'omniauth-github',      '~> 1.1'
gem 'rack-cors',            '~> 0.4',         :require => 'rack/cors'
gem 'jwt'
gem 'netaddr'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'dotenv-rails'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'spring-commands-rspec'
end
