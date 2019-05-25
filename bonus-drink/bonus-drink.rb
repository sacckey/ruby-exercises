def count_additional_bottle(n)             # 空き瓶の本数を受け取って追加で飲める本数を返す
  if n<3
    0
  else
    n/3 + count_additional_bottle(n/3+n%3)
  end
end

def count_bottle(n)
  n + count_additional_bottle(n)           # 最初に飲んだ本数と、追加で飲める本数の和を計算
end

puts count_bottle 0     # => 0
puts count_bottle 1     # => 1
puts count_bottle 3     # => 4
puts count_bottle 11    # => 16
puts count_bottle 100   # => 149