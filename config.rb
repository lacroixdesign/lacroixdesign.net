require "boarding_pass"

set :helpers_dir, "helpers"
set :helpers_filename_glob, "**/*_helper.rb"
set :helpers_filename_to_module_name_proc, Proc.new { |filename|
  basename = File.basename(filename, File.extname(filename))
  basename.camelcase
}

Time.zone = "America/Chicago"

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# page "*", :layout => :article

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# activate :blog do |blog|
#   blog.name = "blog"
#   blog.prefix = "blog"
#   blog.sources = ":title"
#   blog.default_extension = ".erb"
# end

activate :blog do |blog|
  blog.name = "case-studies"
  # blog.permalink = "case-studies/{title}"
  blog.permalink = "{title}"
  blog.prefix = "case-studies"
  # blog.sources = "case-studies/{title}"
  # blog.sources = "case-studies/:title"
  blog.default_extension = ".slim"
  # blog.sources = "case-studies/:title.html"
  # blog.sources = "case-studies/:title"
  # #
  blog.sources   = "{title}.html"
  blog.layout    = "layouts/case_study"
  # blog.prefix    = "portfolio"
  # blog.permalink = ":title"
end

activate :directory_indexes

activate :deploy do |deploy|
  deploy.method = :git
  # deploy.remote = "origin" # uses 'origin' by default
  # deploy.branch = "gh-pages" # uses 'gh-pages' by default
end

set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'
set :fonts_dir,  'fonts'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css, :inline => true

  # Minify Javascript on build
  activate :minify_javascript, :inline => true

  # Enable cache buster
  activate :asset_hash

  activate :minify_html
  activate :gzip

  # activate :asset_host
  # set :asset_host, "http://cdn.example.com"

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
