# frozen_string_literal: true

require_relative "lib/wikirate4ruby/version"

Gem::Specification.new do |spec|
  spec.name = "wikirate4ruby"
  spec.version = Wikirate4ruby::VERSION
  spec.authors = ["Vasiliki Gkatziaki"]
  spec.email = ["vasgat@gmail.com"]

  spec.summary = "A Simple API wrapper for Wikirate's API"
  spec.description = "The Wikirate4ruby is an open-source ruby library for the Wikirate API. "
  spec.homepage = %q{https://github.com/wikirate/wikirate4ruby}
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage
  spec.license = "GPL-3.0-or-later"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 2.7.4'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
