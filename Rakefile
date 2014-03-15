require "bundler/setup"

def build
  system "middleman build --clean"
end

desc "Run development server"
task :server do
  system "middleman server"
end

desc "Build & clean"
task :build do
  build
end

desc "Build & deploy to Github Pages"
task :deploy do
  build
  system "middleman deploy"
end

namespace :domain do
  desc "Set domain name"
  task :set do
    require "highline/import"
    if current_domain
      say "Current domain name is <%= color(current_domain, GREEN) %>"
      set_domain = agree("Would you like to set a different one? y/n")
      create_domain if set_domain
    else
      create_domain
    end
  end

  desc "Display the current domain name"
  task :show do
    require "highline/import"
    if current_domain
      say "Current domain name is <%= color(current_domain, GREEN) %>"
      puts ""
    else
      say "<%= color('Missing or invalid domain name.', RED) %>"
      set_domain = agree("Would you like to set one now? y/n")
      create_domain if set_domain
    end
  end

  def cname_file
    "source/CNAME"
  end

  def current_domain
    if File.file?(cname_file)
      domain = File.open(cname_file, "r") {|f| f.read}
    end
    unless domain && domain.split("\n").size == 1 && domain =~ /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$/
      return false
    end
    domain
  end

  def create_domain
    domain = ask("Provide a domain name, such as <%= color('www.lacroix.io', BLUE) %>:") do |q|
      q.validate = /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$/
      q.responses[:not_valid] = "That domain name is not valid."
    end
    File.open(cname_file, "w+") do |f|
      f.write(domain)
    end
    say "<%= color(current_domain, GREEN) %> was successfully set."
  end
end

task :domain => ["domain:show"]
