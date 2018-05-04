module ApplicationHelper

  # 時刻を年月日時刻のシンプルな表記にせよ
  def simple_time(time)
    time.strftime("%Y/%m/%d %H:%M:%S")
  end
end
