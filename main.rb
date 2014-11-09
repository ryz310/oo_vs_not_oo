require 'active_support'
require 'active_support/core_ext'
require './jar'

cooking_thread = 
  Thread.new do
    begin
      jar  = Jar.new(10, 13, 10.seconds.since)
      rice = jar.serve_rice
      puts "「#{ rice }」が出来ました！"
    rescue => e
      puts e
    end
  end

loop do
  break unless cooking_thread.status
  puts 'ご飯待機中'
  sleep(1)
end

