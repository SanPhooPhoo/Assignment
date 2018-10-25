require 'spreadsheet'
book = Spreadsheet::Workbook.new
sheet1=book.create_worksheet :name => 'Assignment' 
j=0
begin
loop do
puts "Enter first number"
first=gets.chomp.to_i
puts "Enter second number"
second=gets.chomp.to_i
puts "Operation(+,-,*,/)"
op=gets.chomp

if op=="+"
ans=first+second

elsif op=="-"
ans=first-second

elsif op=="*"
ans=first*second

elsif op=="/"
ans=first/second
end
time=Time.new
sheet1.row(j).push first, op, second, '=', ans, time.inspect
format = Spreadsheet::Format.new :horizontal_align => :centre
sheet1.row(j).default_format = format
sheet1.column(5).width = 30
j=j+1

puts "Do You want to do another(y/n)"
i=gets.chomp
if i!="y"
break
end
rescue Exception => e
puts e.message + " is Error."
end
end
book.write Dir.pwd+'\Assignment.xls'