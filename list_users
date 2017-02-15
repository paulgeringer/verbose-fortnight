#!/usr/bin/env ruby

def get_user_list
  raw_list = File.read('/etc/passwd')
  raw_list.split("\n").reject! { |line| line.match(/^#/) }
end

def parse_user_list user_array
  user_array.each do |user|
    user_elements = user.split(":")
    STDOUT.puts "username: #{user_elements[0]}, user_id: #{user_elements[2]}, comments: #{user_elements[4]}"
  end
end

user_list = get_user_list
parse_user_list( user_list )
