$LOAD_PATH.unshift(::File.join(::File.dirname(__FILE__), "lib"))

require 'wix/version'

Gem::Specification.new do |spec|
  spec.name          = "wix-ruby"
  spec.version       = Wix::VERSION
  spec.author        = "Babystep Technologies"
  spec.email         = "support@babystep.io"

  spec.summary       = "Ruby bindings for the Wix API"
  spec.description   = "Wix is a website builder"
  spec.homepage      = "https://babystep.io"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.metadata = {
    "github_repo" => "https://github.com/Babystep-Technologies/wix-ruby.git"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
