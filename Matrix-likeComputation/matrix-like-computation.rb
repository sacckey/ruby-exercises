#while true do
n=gets.to_i
#break if n==0
column_sums=Array.new(n, 0)

rows=n.times.map{gets.split.map(&:to_i)}

row_sum=0
edge=0
rows.each do |row|
  n.times do |i|
    row_sum+=row[i]
    column_sums[i]+=row[i]
    print "%5d" % row[i]
  end
  edge+=row_sum
  puts "%5d" % row_sum
  row_sum=0
end

n.times do |i|
  print "%5d" % column_sums[i]
end
puts "%5d" % edge
#end