desc "Generate Entire Site"
task :gen => ["gen:html", "gen:css", "gen:js"]

namespace :gen do
  
  desc "Generate HTML"
  task :html do
    system "haml -r helper.rb _src/index.haml public/index.html"
    puts "Regenerated site!"
  end
  
  desc "Generate CSS"
  task :css do
    # TODO
  end
  
  desc "Generate JS"
  task :js do
    # TODO
  end
  
end