require_relative 'lib/cutest/reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "cutest-reporter"
  spec.version       = Cutest::Reporter::VERSION
  spec.authors       = ["César Carruitero"]
  spec.email         = ["ccarruitero@protonmail.com"]

  spec.summary       = "extend cutest to allow summary report and some tweacks"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ccarruitero/cutest-reporter"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "cutest"
  spec.add_development_dependency "pry"
end
