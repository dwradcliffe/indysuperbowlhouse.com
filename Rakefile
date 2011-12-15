require 'rubygems'
require 'simple_site'

site = SimpleSite.new
desc "Generate Entire Site"
task :gen => ["gen:html", "gen:css", "gen:js"]

namespace :gen do
  
  desc "Generate HTML"
  task :html do
    site.generate_html
  end
  
  desc "Generate CSS"
  task :css do
    site.generate_css
  end
  
  desc "Generate JS"
  task :js do
    site.generate_js
  end
  
end

desc "Deploy website"
task :deploy do
  site.deploy!
end

namespace :deploy do
  
  task :file do
    site.deploy_file!
  end
  
end
