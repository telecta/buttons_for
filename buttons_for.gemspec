$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "buttons_for/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "buttons_for"
  s.version     = ButtonsFor::VERSION
  s.authors     = ["Ole J. Rosendahl"]
  s.email       = ["ole.johnny.rosendahl@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ButtonsFor."
  s.description = "TODO: Description of ButtonsFor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "railties", ">= 3.2", "< 5.0"
end
