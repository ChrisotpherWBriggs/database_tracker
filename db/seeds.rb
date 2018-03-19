# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', '20180316SYLoad.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Claim.new
  t.lName = row['lName']
  t.fName = row['fName']
  t.bDate = row['bDate']
  t.groupId = row['groupId']
  t.sDate = row['sDate']
  t.drug = row['drug']
  t.planPaid = row['planPaid']
  t.coPay = row['coPay']
  t.totalPaid = row['totalPaid']

  t.save
  puts "#{t.lName}, #{t.fName}, #{t.bDate}, #{t.groupId}, #{t.sDate}, #{t.drug}, #{t.planPaid}, #{t.coPay}, #{t.totalPaid} saved"
end

puts "There are now #{Claim.count} rows in the Wellmont table"