Gem::Specification.new do |s|
  s.name        = 'config_to_env'
  s.version     = '1.0.0'
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = 'Load config file into process env'
  s.description = 'Simple lib for loading json config files into running process environment'
  s.authors     = ['David Buckhurst']
  s.email       = 'david.buckhurst@bbc.co.uk'
  s.files       = [ 'lib/config_to_env.rb', 'LICENSE', 'README.md' ]
  s.homepage    = 'https://github.com/bbc/config_to_env.rb'
  s.license     = 'MIT'
end
