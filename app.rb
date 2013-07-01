require 'bundler/setup'
require 'httpclient'
require 'uri'

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
    erb :upload
  end

  post '/' do
    if params['upfile'].nil?
      @text = "Please select a file!"
    else
      File.open('uploads/' + params['upfile'][:filename], "w") do |f|
        f.write(params['upfile'][:tempfile].read)
      end
      uri = URI.parse('http://spokentech.net:8000/speechcloud/SpeechUploadServlet')
      clnt = HTTPClient.new
      clnt.send_timeout = 10000
      File.open('uploads/' + params['upfile'][:filename]) do |file|
        body = { 'lmFlag'=>'true', 'continuousFlag' => 'true', 'doEndpointing' => 'true' ,'CmnBatchFlag' => 'true', 'audio' => file  }
        @text = ""
        res = clnt.post(uri, body) do |chunk|
          @text << (chunk + ". ")
        end
      end
      
    end
    erb :result
  end

  run! if app_file == $0
end
