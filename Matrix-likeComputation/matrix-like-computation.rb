class MatrixLikeComputation
  def execute
    matrix=calculate_matrix_total(gets.to_i)    # 合計データを付加した行列を、全て結合した文字列を返す
  end

  def calculate_matrix_total(n)                 # 縦横のデータ数を受け取って、縦と横の合計のデータを付加した行列を返す
    return "" if n==0                           # n=0のときは、空文字列を結合して終了する
    ans_matrix=""                               # 行列を表す文字列
    rows = n.times.map{gets.split.map(&:to_i)}  # 行ごとの数値を配列に格納
    rows.each do |row|
      ans_matrix += (row << row.sum).map{|i| "%5d" % i}.join + "\n"   # 行ごとの数値と合計値を結合した文字列を作成
    end
    column_sums = n.times.map{|i| rows.inject(0){|column_sum,row| column_sum+row[i]}}   # 列ごとの合計を配列に格納
    # 列ごとの合計値を行列の末尾に追加し、次の行列を結合
    ans_matrix += (column_sums << column_sums.sum).map{|i| "%5d" % i}.join + "\n" + calculate_matrix_total(gets.to_i) 
  end
end

mlc = MatrixLikeComputation.new
puts mlc.execute