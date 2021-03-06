# encoding: utf-8
###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def livepage_install_link(custom_options = {}, &block)
    options = {
      class: 'btn btn-primary btn-livepage-install',
      target: '_blank',
      data: {
        installed_text: 'Installed 👍',
        installed_class: 'btn-livepage-installed'
      }
    }.merge(custom_options)

    # link_to 'https://chrome.google.com/webstore/detail/livepage/pilnojpmdoofaelbinaeodfpjheijkbh/details', options, &block

    link_to 'https://github.com/MikeRogers0/LivePage', options, &block
  end

  def root_url
    ENV.fetch('URL') { 'https://livepage.mikerogers.io' }
  end

  def current_url
    if current_page.url == '/'
      root_url + '/'
    else
      root_url + current_page.url[0..-1]
    end
  end
end

activate :favicon_maker, icons: {
  '_favicon_template.png' => [
    { icon: 'favicon.png', size: '16x16' },
    { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
  ]
}

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :minify_html do |html|
    html.remove_multi_spaces        = true   # Remove multiple spaces
    html.remove_comments            = true   # Remove comments
    html.remove_intertag_spaces     = false  # Remove inter-tag spaces
    html.remove_quotes              = false  # Remove quotes
    html.simple_doctype             = false  # Use simple doctype
    html.remove_script_attributes   = false  # Remove script attributes
    html.remove_style_attributes    = true   # Remove style attributes
    html.remove_link_attributes     = true   # Remove link attributes
    html.remove_form_attributes     = false  # Remove form attributes
    html.remove_input_attributes    = false  # Remove input attributes
    html.remove_javascript_protocol = true   # Remove JS protocol
    html.remove_http_protocol       = false  # Remove HTTP protocol
    html.remove_https_protocol      = false  # Remove HTTPS protocol
    html.preserve_line_breaks       = false  # Preserve line breaks
    html.simple_boolean_attributes  = true   # Use simple boolean attributes
    html.preserve_patterns          = nil    # Patterns to preserve
  end
  activate :gzip
end
