require 'bundler/setup'
Bundler.require

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack
  register Mustache::Sinatra

  assets do
    serve '/js', from: '/scripts'
    serve '/css', from: '/styles'
    js :app, '/js/app.js', [
      '/js/vendor/*.js',
      '/js/*.js' ]
    css :app, '/css/app.css', [
      '/css/reset.css',
      '/css/*.css' ]
  end

  set :mustache, {
    views: './views/',
    templates: './templates/' }
  require_relative 'views/layout'

  set :scss, {
    load_paths: [ "#{root}/styles" ],
    cache: false }

  before do
    @css = css :app
    @js  = js  :app
  end

  get '/' do
    mustache :index
  end

  run! if app_file == $0
end