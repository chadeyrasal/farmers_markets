require_relative "./lib/farmers_markets/version"

Gem::Specification.new do |spec|
  spec.name          = "farmers_markets"
  spec.version       = FarmersMarkets::VERSION
  spec.authors       = ["'Anne-Laure Chadeyras'"]
  spec.email         = ["'annelaure.chadeyras@gmail.com'"]

  spec.summary       = "Farmers Markets in the UK"
  spec.description   = "The application allows the user to get the list of farmers markets in their district and get specific information about each market upon request"
  spec.homepage      = "https://github.com/chadeyrasal/farmers_markets.git"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
