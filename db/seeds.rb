# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_data = [
"Borrower" => [
  [ :title => "BCM High Income Fund"],
  [ :title => "Broker/Dealer XYZ"],
  [ :title => "Mortgage REIT Inc."],
],

"Deal" => [
  [ :collateral =>"SBA 7a Pools",:term => "O/N"],
  [ :collateral =>"SBA 7a Pools",:term => "1 Week"],
  [ :collateral =>"SBA 7a Loans",:term => "1 Month"],
  [ :collateral =>"FH/FN Bank-eligible MBS",:term => "1 Week"],
  [ :collateral =>"FH/FN Bank-eligible MBS",:term => "1 Month"],
  [ :collateral =>"QM Residential Mortgage Loans",:term => "1 Month"],
]

]
seed_data.each do |object|
  object.each do |name, values|
    name.capitalize.constantize.create(values)
  end
end
