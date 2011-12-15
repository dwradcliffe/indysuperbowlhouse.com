require 'aws/s3'

class SimpleSite
  
  def generate_html
    system "haml -r helper.rb _src/index.haml public/index.html"
    puts "Regenerated site!"
  end
  
  def generate_css
    system "sass _sass/style.sass public/css/style.css"
    puts "Regenerated css!"
  end
  
  def generate_js
    require 'uglifier'
    files = [
      'jquery-1.6.2.min.js',
      'slides.min.jquery.js',
      'plugins.js',
      'photos.js',
      'map.js'
    ]
    system 'mkdir -p _tmp; touch _tmp/js.js; :> _tmp/js.js'
    files.each do |f|
      system "cat _js/#{f} >> _tmp/js.js"
    end
    File.open('public/js/script.js', 'w') {|f| f.write(Uglifier.compile(File.read('_tmp/js.js'))) }
    system 'rm _tmp/js.js'
    puts "Regenerated js!"
  end
  
  def deploy!
    Dir.chdir('public')
    Dir['**/*'].select { |f| File.file?(f) }.each do |file|
      deploy file
    end
  end
  
  def deploy_file!
    Dir.chdir('public')
    ENV['FILES'].select { |f| File.file?(f) }.each do |file|
      deploy file
    end
  end
  
  
  private
    def deploy(file)
      age = 7*24*60*60
      options = {
        :access => :public_read,
        :cache_control => "max-age=#{age}",
        :expires => age.from_now.httpdate
      }
      puts "  --> #{file}"
      %w(www.indysuperbowlhouse.com www.indysuperbowlrentalhouse.com).each do |bucket|
        AWS::S3::S3Object.store(file, open(file), bucket, options)
      end
    end
  
end