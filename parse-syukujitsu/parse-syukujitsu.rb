require 'csv'
require 'date'

class ParseSyukujitsu
  def self.parse
    syukujitsu = CSV.read("./syukujitsu.csv")       # syukujitsu.csvを読み込んで配列に格納
    parsed_syukujitsu = {}                          # パース後の祝日一覧を格納するハッシュ
    syukujitsu[0].join.scan(/\d{4}/).map(&:to_i).each do |year|   # キーが西暦のハッシュを作成しておく
      parsed_syukujitsu[year]={}
    end

    2.upto(syukujitsu.size-1) do |line_count|                 # 3行目から末尾まで一行ずつ処理
      break unless holiday=syukujitsu[line_count][0]          # 祝日名を取得、nilの場合は終了
      syukujitsu[line_count].each_slice(2).map(&:last).each do |str_date|   # 祝日の日付を取り出す
        year=str_date[/\d{4}/].to_i
        date=Date.parse(str_date)
        parsed_syukujitsu[year][date]=holiday               # 日付と祝日名の対応をハッシュに追加
      end
    end
  return parsed_syukujitsu
  end
end

# p ParseSyukujitsu.parse