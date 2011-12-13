# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'shell' do
  watch(%r{^_src/.+\.haml}) {|m| `rake gen:html` }
end

guard 'shell' do
  watch(%r{^_sass/.+\.(sass|scss|css)}) {|m| `rake gen:css` }
end
