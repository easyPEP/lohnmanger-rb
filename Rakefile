require "bundler/gem_tasks"
require "rake/testtask"

def default_env_file
  ::File.join(Dir.getwd, '.env')
end

def set_env
  envfile = default_env_file
  ::File.readlines(envfile).each {|line|
    next if line.chomp == "" || line =~ /^#/
    parts = line.chomp.split('=')
    ENV[parts[0]] = parts[1..-1].join('=')
  } if ::File.exist?(envfile)
end

set_env

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

