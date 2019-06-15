# 1: . , ! ? (スペース)
# 2: a b c
# 3: d e f
# 4: g h i
# 5: j k l
# 6: m n o
# 7: p q r s
# 8: t u v
# 9: w x y z
# 0: 確定ボタン

class KeitaiMessage
  @@button = {                         # 数字と文字の対応をハッシュで持っておく
    '1' => ['.',',','!','?',' '],
    '2' => [*'a'..'c'],
    '3' => [*'d'..'f'],
    '4' => [*'g'..'i'],
    '5' => [*'j'..'l'],
    '6' => [*'m'..'o'],
    '7' => [*'p'..'s'],
    '8' => [*'t'..'v'],
    '9' => [*'w'..'z'],
    '0' => ['']
  }
  def execute
    output=number2string(gets.to_i)    # 数字列を文字列に変換し、結合して返す
  end

  def number2string(n)
    output=''                           # n行分の文字列を格納
    n.times do
      input_numbers=gets.chomp.chars    # 数字列を受け取って配列に格納
      line=''                           # 1行分の文字列を格納
      push_count=0                      # ボタンを押した回数をカウント
      prev_number='0'                   # 一つ前に押された数字を持っておく
      input_numbers.each do |input_number|
        if input_number=='0'                                        # 0が押されたら文字を確定
          array_size = @@button[prev_number].size
          line+=@@button[prev_number][(push_count-1)%array_size]    # 数字列を文字に変換して末尾に追加
          push_count=0
        else
          push_count+=1                 # 0以外が押されたときは、押した回数を数える
        end
        prev_number=input_number        # 一つ前に押された数字を更新
      end
      output+=line+"\n"                 # 1行ずつoutputに追加
    end
    return output
  end
end

km=KeitaiMessage.new
puts km.execute