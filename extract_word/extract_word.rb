class ExtractWord
  def self.execute(input_file_path)
    ew=ExtractWord.new
    ew.execute(input_file_path)
  end

  def execute(input_file_path)
    text = File.read(input_file_path)                       # テキストファイルを読み込んで、中身を格納
    idioms_and_words = extract_iw(text)                     # 文字列内から英熟語と英単語を抽出する
    idiom_count,word_count= count_iw(idioms_and_words)      # 英熟語の数と英単語の数を数える
    summarize_result(idiom_count,word_count)                # 結果をまとめる
  end

  def extract_iw(text)
    words = text.scan(/[A-Z][\w’\/]*(?:\s(?:[A-Z][\w’\/]*|of))+|[\w’-]+/)     # 英熟語を優先して抽出
  end

  def count_iw(idioms_and_words)
    idiom_count = Hash.new(0)                 # キーが英熟語で、値が出現回数のハッシュを作る
    word_count = Hash.new(0)                  # キーが英単語で、値が出現回数のハッシュを作る
    idioms_and_words.each do |iw|
      if iw.include?(" ")                     # 文字列にスペースが含まれていたら、英熟語のカウントを増やす
        idiom_count[iw]+=1
      else
        word_count[iw]+=1                     # そうでなければ、英単語のカウントを増やす
      end
    end                                       # カウントの多い順かつ辞書順にハッシュをソートして返す
    return [idiom_count,word_count].map{|result| result.sort_by{|iw,count| [-count,iw.downcase]}}
  end

  def summarize_result(idiom_count,word_count)
    result="単語数（熟語以外）：#{word_count.inject(0){|cnt,ar| cnt+ar[1]}}\n英熟語？------------------------------------------------------------------\n"
    idiom_count.each do |idiom,count|
      result += "#{"%3d" % count} #{idiom}\n"
    end
    result+="英単語------------------------------------------------------------------\n"
    word_count.each do |word,count|
      result += "#{"%3d" % count} #{word}\n"
    end
    return result.chomp
  end

end
