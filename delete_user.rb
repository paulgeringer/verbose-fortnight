#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'

def delete_user( user_name )
  exit(1) if user_name == 'root'
  `userdel user_name`
  if $?.exitstatus != 0
    exit $?.exitstatus
  end
end

def delete_home_directory( user_name )
  FileUtils.rm_rf( "/home/#{user_name}/" )
end

options = {}
OptParse.new do |opts|
  opts.banner = "Usage: delete_user [options]"

  opts.on("-u USER", "--user USER", "Specify user to delete") do |u|
    options[:user] = u
  end

  opts.on("-h", "--help", "Print this help text") do |h|
    puts opts
    exit
  end
end.parse!

user_name = options[:user]
delete_user( user_name )
delete_home_directory( user_name )
