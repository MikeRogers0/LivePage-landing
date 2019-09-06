ruby File.read('.ruby-version').chomp

source 'https://rubygems.org' do
  gem 'dotenv', groups: %i[development test]

  gem 'puma', '~> 3.7'
  gem 'rake'
  gem 'rack-contrib'

  gem 'middleman'
  gem 'middleman-autoprefixer'
  gem 'middleman-minify-html'
  gem 'middleman-sprockets'
  gem 'middleman-favicon-maker'
  gem 'middleman-cdn'

  gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]
  gem 'wdm', '~> 0.1', platforms: [:mswin, :mingw]


  group :development do
    gem 'capistrano', '~> 3.11'
    gem 'capistrano-rbenv', '~> 2.1'
    gem 'capistrano-bundler', '~> 1.3'
    gem 'capistrano3-puma', '~> 3.1'
    gem 'capistrano-yarn'
    gem 'capistrano-logrotate'
  end
end
