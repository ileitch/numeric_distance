# -*- encoding: utf-8 -*-
require File.expand_path('../lib/numeric_distance/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ian Leitch"]
  gem.email         = ["port001@gmail.com"]
  gem.description   = %q{Extends Ruby's Numeric object with distance methods.}
  gem.summary       = %q{Extends Ruby's Numeric object with distance methods.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "numeric_distance"
  gem.require_paths = ["lib"]
  gem.version       = NumericDistance::VERSION
end
