source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.2', require: false

#bootstrap用に追記
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'

#devise関係の追記
gem 'devise'
gem 'cancancan'
gem 'rails_admin', '~> 2.0', git: 'https://github.com/sferik/rails_admin.git'
# gem 'rails_admin'

gem 'dotenv-rails'

#フォントによるエラー対策のため追記
gem 'font-awesome-rails'

#enum用
gem 'enum_help'

#qrコード表示用
gem 'rqrcode'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  #検証用に追記
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
