require 'csv'
require 'date'

class ParseSyukujitsu
  def self.parse
    syukujitsu = {}
    CSV.foreach('./syukujitsu.csv') do |row|
      if row[0]==nil
        break
      end

      if syukujitsu=={}
        row.each_slice(2).map(&:first).each do |year|
          seireki=year[/\d{4}/].to_i
          syukujitsu[seireki]={}
        end
      else
        holiday=row[0]
        row.each_slice(2).map(&:last).each do |date|
          seireki=date[/\d{4}/].to_i
          if seireki>0
            date=Date.parse(date)
            syukujitsu[seireki][date]=holiday
          end
        end
      end
    end
  return syukujitsu
  end
end

p ParseSyukujitsu.parse