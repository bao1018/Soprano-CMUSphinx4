require_relative 'test_helper'

class RoutesTest < App::Test

  include Rack::Test::Methods

  def app
    App
  end

  test 'get returns hi world' do
    get '/'
    assert last_response.body.include? 'Hi, world'
  end

  test 'get returns 200 status' do
    get '/'
    assert_equal 200, last_response.status
  end

  test 'can access reset.css' do
    get '/css/reset.css'
    assert_equal 200, last_response.status
    assert last_response.body.include? 'acronym'
  end

  test 'main.js status is 200' do
    get '/js/main.js'
    assert_equal 200, last_response.status
  end

end
