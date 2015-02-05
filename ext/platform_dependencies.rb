require 'rubygems/dependency_installer'

installer = Gem::DependencyInstaller.new

begin
  ruby_version = RUBY_VERSION.sub /^[a-z-]*/, ''
  if ruby_version >= '2.0'
    puts "Installing byebug for Ruby #{ruby_version}"
    installer.install 'byebug'
  elsif ruby_version >= '1.9'
    puts "Installing debugger for Ruby #{ruby_version}"
    installer.install 'debugger'
  elsif ruby_version >= '1.8'
    puts "Installing ruby-debug for Ruby #{ruby_version}"
    installer.install 'ruby-debug'
  end
rescue => e
  warn "#{$0}: #{e}"

  exit!
end

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close
