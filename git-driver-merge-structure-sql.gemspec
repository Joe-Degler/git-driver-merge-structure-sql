
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "git-driver-merge-structure-sql"

Gem::Specification.new do |spec|
  spec.name          = "git-driver-merge-structure-sql"
  spec.version       = StructureSqlMergeDriver::VERSION
  spec.authors       = ["Akinori MUSHA", "Joe Degler"]
  spec.email         = ["knu@idaemons.org", "joe@degler.dev"]
  spec.license       = "BSD-2-Clause"

  spec.summary       = %q{git merge driver for db/structure.sql in a Rails project. Originally forked from git-merge-structure-sql}
  spec.homepage      = "https://github.com/Joe-Degler/git-driver-merge-structure-sql"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "https://github.com/Joe-Degler/git-driver-merge-structure-sql/blob/master/CHANGELOG.md"
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
