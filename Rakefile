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
    system "sass _sass/style.sass public/css/style.css"
    puts "Regenerated css!"
  end
  
  desc "Generate JS"
  task :js do
    # TODO
  end
  
end

desc "Deploy website"
task :deploy do
  require 'rubygems'
  require 'aws/s3'
  

  
  Dir.chdir('public')
  Dir['**/*'].select { |f| File.file?(f) }.each do |file|
    puts "  --> #{file}"
    %w(www.indysuperbowlhouse.com www.indysuperbowlrentalhouse.com).each do |bucket|
    
      AWS::S3::S3Object.store(file, open(file), bucket, :access => :public_read)
      
    end
  end
  
end

namespace :deploy do
  
  task :file do
    require 'rubygems'
    require 'aws/s3'

    
    Dir.chdir('public')
    ENV['FILES'].select { |f| File.file?(f) }.each do |file|
      puts "  --> #{file}"
      %w(www.indysuperbowlhouse.com www.indysuperbowlrentalhouse.com).each do |bucket|

        AWS::S3::S3Object.store(file, open(file), bucket, :access => :public_read)

      end
    end
    
  end
  
end
