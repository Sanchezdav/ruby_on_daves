require_relative "test_helper"

class TestController < RubyOnDaves::Controller
  def index
    "Hello!"
  end
end

class TestApp < RubyOnDaves::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class RubyOnDavesAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/route"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end
end
