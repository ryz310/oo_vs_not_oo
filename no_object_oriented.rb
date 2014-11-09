require 'active_support'
require 'active_support/core_ext'

rice_amount    = 10
water_amount   = 12
scheduled_time = 5.seconds.since

begin
  if scheduled_time.present?
    puts "予約時刻#{ scheduled_time.strftime('%H:%M.%S') }まで待機します"
    required_cooking_time = 3.seconds
    wait_time = scheduled_time - DateTime.now - required_cooking_time
    if wait_time < 0.0
      raise 'その時刻に炊きあげるのは無理っす'
    end
    sleep(wait_time)
  end

  puts "今からご飯を炊きます: #{ DateTime.now.strftime('%H:%M.%S') }"

  sleep(required_cooking_time)
  required_water = rice_amount * 1.2
  rice = 
    if water_amount == required_water
      '美味しいご飯'
    elsif water_amount < required_water
      '固くて芯のあるご飯'
    else
      'ベチャベチャのご飯'
    end
  puts "ご飯が炊けました: #{ DateTime.now.strftime('%H:%M.%S') }"
  puts "「#{ rice }」が出来ました！"
rescue => e
  puts e
end

