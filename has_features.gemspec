$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "has_features/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "has_features"
  s.version     = HasFeatures::VERSION
  s.authors     = ["vikramnet2003"]
  s.email       = ["vikramnet2003@gmail.com"]
  s.homepage    = "http://rubygems.org"
  s.summary     = "Gem for adding features to user defined model"
  s.description = "Gem for adding features to user defined model"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activerecord", "> 4.2"

  s.add_development_dependency "rails", "> 4.2"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2", "> 0.4"
end
