# -*- encoding: utf-8 -*-
# stub: bootswatch-rails 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bootswatch-rails"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Maxim Chernyak"]
  s.date = "2013-05-22"
  s.description = "Bootswatches converted to SCSS ready to use in Rails 3 asset pipeline."
  s.email = ["max@bitsonnet.com"]
  s.homepage = "http://github.com/maxim/bootswatch-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Bootswatches in your Rails asset pipeline"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
  end
end
