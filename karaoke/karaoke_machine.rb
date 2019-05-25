class KaraokeMachine
  def initialize(melody)
    @melody=melody.reverse                    # メロディーを反転させる
  end

  def transpose(key)
    keys = %w(C C# D D# E F F# G G# A A# B)   # キーを配列で持っておく
    downkey = key % (-12)                     # keyを(-12)で割った余りを持つことで、
    newmelody=""                              # キーの変換を引き算で行うことができる
    pre=""
    flg = false
    @melody.each_char do |m|                  # メロディーを後ろから1文字ずつ見ていく
      if m=='#'                               # '#'が現れたらその次の一文字と連結させる
        flg = true
        next
      end
      if flg
        m=m+'#'
        flg =false
      end
      if keys.include?(m)                     # 文字mがキーを表していたら、キーを変換する
        newkey = keys.index(m)+downkey
        newmelody = keys[newkey] + newmelody
      else                                    # 文字mがキーで無ければそのまま
        newmelody = m + newmelody
      end
    end
    
    return newmelody
  end
end