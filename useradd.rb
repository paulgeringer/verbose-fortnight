#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'

def create_user( user_name )
  `useradd #{user_name}`
  if $?.exitstatus != 0
    exit $?.exitstatus
  end
end

def setup_ssh( pubkey_filename )
  FileUtils.mkdir_p( "/home/#{user_name}/.ssh" )

  pubkey = File.read(pubkey_filename).strip!
  key_prefix = pubkey.split(' ').first
  key_type = key_prefix.split('-')[1]

  File.open( "/home/#{user_name}/.ssh/id_#{key_type}" ) do |file|
    file.write pubkey
  end
end

options = {}
OptParser.new do |opts|
  opts.banner = "Usage: monitor [options]"

  opts.on("-f PUBKEY FILE", "--file PUBKEY FILE", "Specify public key file") do |f|
    options[:pubkey] = f
  end

  opts.on("-u USER", "--user USER", "Specify user to create") do |u|
    options[:user] = u
  end

  opts.on("-h", "--help", "Print this help text") do |h|
    puts opts
    exit
  end
end.parse!

user_name = options[:user]
pubkey_filename = options[:pubkey]

create_user( user_name )
setup_ssh( pubkey_filename )
