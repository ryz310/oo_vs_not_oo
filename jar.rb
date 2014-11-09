require 'active_support'
require 'active_support/core_ext'

# 美味しいごはんの炊き方
class Jar
  # rice_amount:    米の分量
  # water_amount:   水の分量
  # scheduled_time: 予約時刻
  def initialize(rice_amount, water_amount, scheduled_time = nil)
    @rice_amount  = rice_amount
    @water_amount = water_amount
    
    wait_for_scheduled_time(scheduled_time)
    cooking!
  end
  
  # 炊き上がったご飯をよそう
  def serve_rice
    @rice
  end
  
  private
  
  # 予約時刻まで炊飯を待つ
  def wait_for_scheduled_time(scheduled_time)
    return if scheduled_time.blank?
    puts "予約時刻#{ scheduled_time.strftime('%H:%M.%S') }まで待機します"
    wait_time = scheduled_time - DateTime.now - required_cooking_time
    if wait_time < 0.0
      raise 'その時刻に炊きあげるのは無理っす'
    end
    sleep(wait_time)
  end
  
  # 米と水の分量に応じた品質のご飯を炊きあげる
  def cooking!
    puts "今からご飯を炊きます: #{ DateTime.now.strftime('%H:%M.%S') }"
    sleep(required_cooking_time)
    @rice = 
      if @water_amount == required_water
        '美味しいご飯'
      elsif @water_amount < required_water
        '固くて芯のあるご飯'
      else
        'ベチャベチャのご飯'
      end
    puts "ご飯が炊けました: #{ DateTime.now.strftime('%H:%M.%S') }"
  end
  
  # 必要な水の量
  def required_water
    @rice_amount * 1.2
  end
  
  # 米を炊くのに必要な時間
  def required_cooking_time
    3.seconds
  end
end
