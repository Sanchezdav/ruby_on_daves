require "ruby_on_daves/array"
require "ruby_on_daves/version"

module RubyOnDaves
  class Application
    def call(env)
      `echo debug > debug.txt`;
      [200, {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Daves!"]]
    end
  end
end
