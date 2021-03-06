require_relative 'lib/ruby_on_daves/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_on_daves"
  spec.version       = RubyOnDaves::VERSION
  spec.authors       = ["David Sanchez"]
  spec.email         = ["sanchez.dav90@gmail.com"]

  spec.summary       = "A Rack-based web framework."
  spec.description   = "A Rack-based web framework with some extra juice."
  spec.homepage      = "https://codeando.dev"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://rubygems.org/ruby_on_daves"
  spec.metadata["changelog_uri"] = "https://rubygems.org/ruby_on_daves/changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rack', '~> 2.2'
  spec.add_runtime_dependency 'erubis', '~> 2.7'
  spec.add_runtime_dependency 'multi_json', '~> 1.15'
  spec.add_runtime_dependency 'sqlite3', '~> 1.4.2'
  spec.add_development_dependency 'rack-test', '~> 1.1'
  spec.add_development_dependency 'minitest', '~> 5.14.2'
end
