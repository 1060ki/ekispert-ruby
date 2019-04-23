lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ekispert/version'

Gem::Specification.new do |spec|
  spec.name          = 'ekispert'
  spec.version       = Ekispert::VERSION
  spec.authors       = ['Tomoki Ichikawa']
  spec.email         = ['ichikawa1060@gmail.com']

  spec.summary       = 'A Ruby library for Ekispert API'
  spec.description   = 'A Ruby library for Ekispert API'
  spec.homepage      = 'https://github.com/1060ki/ekispert-ruby'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('faraday', '~> 0.13')

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
