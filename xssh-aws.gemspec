require_relative 'lib/xssh/aws/version'

Gem::Specification.new do |spec|
  spec.name          = "xssh-aws"
  spec.version       = Xssh::Aws::VERSION
  spec.authors       = ["gen"]
  spec.email         = ["ymdtshm@gmail.com"]

  spec.summary       = 'cross ssh client'
  spec.description   = 'cross ssh client'
  spec.homepage      = 'https://github.com/Gen-Arch/xssh-aws'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")


  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'xssh',        '~> 0.1'
  spec.add_runtime_dependency 'aws-sdk-ec2', '~> 1.2'

  spec.add_development_dependency 'solargraph'
  spec.add_development_dependency 'rake'
end
