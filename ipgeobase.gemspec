# frozen_string_literal: true

require_relative 'lib/ipgeobase/version'

Gem::Specification.new do |spec|
  spec.name          = 'ipgeobase'
  spec.version       = Ipgeobase::VERSION
  spec.authors       = ['yorickov']
  spec.email         = ['yorickov@gmail.com']

  spec.summary       = 'Wrapper of service <ip-api.com>'
  spec.description   = 'Service for obtaining information about location using IP'
  spec.homepage      = 'https://github.com/Yorickov/ipgeobase'
  spec.required_ruby_version = '>= 3.0.1'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = 'https://github.com/Yorickov/ipgeobase/issues'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
