require 'rubygems'
require 'bundler'
Bundler.setup

require 'dotenv'
Dotenv.load

require 'middleman-core/load_paths'
::Middleman.setup_load_paths

require 'middleman-core'
require 'middleman-core/rack'
require 'rack/contrib'

require 'fileutils'
FileUtils.mkdir('log') unless File.exist?('log')
::Middleman::Logger.singleton("log/#{ENV['RACK_ENV']}.log")

# Keep out the unwanted people.
if ENV['REQUIRE-AUTH'] && ENV['REQUIRE-AUTH'] == 'true'
  use Rack::Auth::Basic, 'Restricted Area' do |username, password|
    [username, password] == %w[awesome awesome]
  end
end

# When in production, use the build folder.
if ENV['SERVE_STATIC'] &&ENV['SERVE_STATIC'] == 'true'
  # Serve static files under a `build` directory:
  # - `/` will try to serve your `build/index.html` file
  # - `/foo` will try to serve `build/foo` or `build/foo.html` in that order
  # - missing files will try to serve build/404.html or a tiny default 404 page

  module Rack
    class Redirect
      def initialize(app)
        @app = app
      end
      
      def redirect(location)
        [301, {'Location' => location, 'Content-Type' => 'text/html'}, ['Moved Permanently']]
      end

      def call(env)
        redirects = {
          '/download' => 'https://chrome.google.com/webstore/detail/livepage/pilnojpmdoofaelbinaeodfpjheijkbh/details'
        }
        req = Rack::Request.new(env)
        return redirect(redirects[req.path]) if redirects.include?(req.path)
        @app.call(env)
      end
    end
  end

   use Rack::TryStatic,
    root: 'build',
    urls: %w[/], try: ['.html', 'index.html', '/index.html'],
    header_rules: [
      [:all, {
        'X-Frame-Options' => 'SAMEORIGIN',
        'X-XSS-Protection' => '1; mode=block',
        'X-Content-Type-Options' => 'nosniff',
        'Content-Security-Policy' => ENV.fetch('CONTENT_SECURITY_POLICY') { '' },
        'Strict-Transport-Security' => 'max-age=15552000; includeSubDomains',
        'Referrer-Policy' => 'no-referrer-when-downgrade'
      }],
      [['png', 'jpg', 'js', 'css', 'svg', 'woff', 'ttf', 'eot'], { 'Cache-Control' => 'public, max-age=31536000' }]
    ]

  use Rack::Redirect

  # Run your own Rack app here or use this one to serve 404 messages:
  run lambda { |_env|
    not_found_page = File.expand_path('../build/404/index.html', __FILE__)
    if File.exist?(not_found_page)
      [404, { 'Content-Type'  => 'text/html' }, [File.read(not_found_page)]]
    else
      [404, { 'Content-Type'  => 'text/html' }, ['404 - page not found']]
    end
  }

else
  # Otherwise run middleman server as a rack app.
  app = ::Middleman::Application.new
  run ::Middleman::Rack.new(app).to_app
end
