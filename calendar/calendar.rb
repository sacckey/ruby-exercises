require 'date'

head = Date.today.strftime("%B %Y")  # 今日の月と西暦を取得
year = Date.today.year
mon = Date.today.mon
firstday_wday = Date.new(year,mon,1).wday   # 今月1日の曜日を取得(0~6)
lastday_date = Date.new(year,mon,-1).day    # 今月の最終日を取得
week = %w(Su Mo Tu We Th Fr Sa)

puts head.center(20)        # 月と西暦中央寄せで出力
puts week.join(" ")         # 曜日を出力
print "   " * firstday_wday # 1日までの空白を出力

wday = firstday_wday
(1..lastday_date).each do |date|    # 1~最終日まで繰り返し
  print date.to_s.rjust(2) + " "    # 日付を右寄せで表示
  wday = wday+1
  if wday%7==0                      # 土曜日まで表示したら改行
    print "\n"
  end
end
if wday%7!=0
  print "\n"
end
