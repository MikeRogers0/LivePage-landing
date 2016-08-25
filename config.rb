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
   def livepage_install_link custom_options = {}, &block
     options = {
       class: 'btn btn-primary',
       onclick: 'chrome.webstore.install(); return false;',
       target: '_blank'
     }.merge(custom_options)

     link_to 'https://chrome.google.com/webstore/detail/livepage/pilnojpmdoofaelbinaeodfpjheijkbh/details', options, &block
   end
 end

activate :autoprefixer

activate :favicon_maker, :icons => {
  "_favicon_template.png" => [
    { icon: "favicon.png", size: "16x16" },
    { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
  ]
}

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript

  # Append a hash to asset urls (make sure to use the url helpers)
  activate :asset_hash
end
