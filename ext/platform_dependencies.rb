require 'rubygems/dependency_installer'

installer = Gem::DependencyInstaller.new

begin
  if RUBY_VERSION >= '2.0'
    puts "Installing byebug for Ruby #{RUBY_VERSION}"
    installer.install 'byebug'
  elsif RUBY_VERSION >= '1.9'
    puts "Installing debugger for Ruby #{RUBY_VERSION}"
    installer.install 'debugger'
  elsif RUBY_VERSION >= '1.8'
    puts "Installing ruby-debug for Ruby #{RUBY_VERSION}"
    installer.install 'ruby-debug'
  end
rescue => e
  warn "#{$0}: #{e}"

  exit!
end

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close
