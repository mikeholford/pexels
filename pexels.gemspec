
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pexels/version"

Gem::Specification.new do |spec|
  spec.name          = "pexels"
  spec.version       = Pexels::VERSION
  spec.authors       = ["Mike Holford"]
  spec.email         = ["mike@holfy.io"]

  spec.summary       = %q{A ruby wrapper for the Pexels API}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/mikeholford/pexels"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr", '~> 4.0.0'
  spec.add_development_dependency "webmock", '~> 3.5.1'

  spec.add_development_dependency "faraday", '~> 0.15.4'
  spec.add_development_dependency "json", '~> 2.1.0'
end
