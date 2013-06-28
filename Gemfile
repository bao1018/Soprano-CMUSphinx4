source 'http://rubygems.org'

gem 'sinatra', require: 'sinatra/base'
gem 'thin'

gem 'sinatra-assetpack', require: 'sinatra/assetpack',
  git: 'https://github.com/rstacruz/sinatra-assetpack.git'

gem 'mustache', require: 'mustache/sinatra'
gem 'coffee-script'
gem 'sass'
gem "httpclient"
group :test do
  gem 'minitest', require: 'minitest/autorun'
  gem 'minitest', require: 'minitest/pride'
  gem 'rack-test', require: 'rack/test'
end

group :development do
  gem 'guard'
  gem 'guard-livereload'
  gem 'rb-fsevent'
end
