require 'rack/request'
require 'erubis'
require 'ruby_on_daves/file_model'

module RubyOnDaves
  class Controller
    include RubyOnDaves::Model

    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def request
      @request ||= Rack::Request.new(@env)
    end

    def response(text, status = 200, headers = {})
      raise 'Already responded!' if @response

      clean_text = [text].flatten
      @response = Rack::Response.new(clean_text, status, headers)
    end

    def get_response
      @response
    end

    def render_response(*args)
      response(render(*args))
    end

    def params
      request.params
    end

    def render(view_name, locals = {})
      filename = File.join('app', 'views', controller_name, "#{view_name}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: env))
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      RubyOnDaves.to_underscore(klass)
    end
  end
end
