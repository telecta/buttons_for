$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "buttons_for/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "buttons_for"
  s.version     = ButtonsFor::VERSION
  s.authors     = ["Ole J. Rosendahl"]
  s.email       = ["ole.johnny.rosendahl@gmail.com"]
  s.homepage    = "https://github.com/blacktangent/buttons_for"
  s.summary     = "Easily create Bootstrap buttons in Rails."
  s.description = "ActionView Helper for generating Bootstrap buttons."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", ">= 3.2", "< 5.0"
  s.add_dependency "font-awesome-rails", "~> 4.4"

  s.add_development_dependency "coveralls"
end
