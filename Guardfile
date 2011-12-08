# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'shell' do
  watch(%r{^_src/.+\.haml}) {|m| notify `rake gen` }
  # watch(%r{^_src/index.haml}) {|m| `rake gen` }
  # watch(%r{^_src/(.*).haml}) {|m| `rake gen` }
end
