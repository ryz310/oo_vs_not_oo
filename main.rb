require 'active_support'
require 'active_support/core_ext'
require './jar'

begin
  jar  = Jar.new(10, 13, 10.seconds.since)
  rice = jar.serve_rice
  puts "「#{ rice }」が出来ました！"
rescue => e
  puts e
end

