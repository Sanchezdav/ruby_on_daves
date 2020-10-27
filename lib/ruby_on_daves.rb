require "ruby_on_daves/version"
require "ruby_on_daves/routing"
require "ruby_on_daves/util"
require "ruby_on_daves/dependencies"
require "ruby_on_daves/controller"
require "ruby_on_daves/file_model"

module RubyOnDaves
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'},
        [text]]
    end
  end
end
