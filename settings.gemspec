# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'settings/version'

Gem::Specification.new do |gem|
  gem.name          = "settings"
  gem.version       = Settings::VERSION
  gem.authors       = ["Steven Soroka"]
  gem.email         = ["ssoroka78@gmail.com"]
  gem.description   = %q{Gem stores app settings}
  gem.summary       = %q{stores app settings in a way I like}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
