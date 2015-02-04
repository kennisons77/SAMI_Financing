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
  [ :collateral =>"SBA 7a Pools",:term => "night"],
  [ :collateral =>"SBA 7a Pools",:term => "week"],
  [ :collateral =>"SBA 7a Loans",:term => "month"],
  [ :collateral =>"FH/FN Bank-eligible MBS",:term => "week"],
  [ :collateral =>"FH/FN Bank-eligible MBS",:term => "month"],
  [ :collateral =>"QM Residential Mortgage Loans",:term => "month"],
],
"Lender" => [
  [:title=>"SELECT BANK & TRUST",:state=>"NC", :account=>1040676909],
  [:title=>"FIRST NATIONAL BANK",:state=>"TX", :account=>1040667704],
  [:title=>"LOS ALAMOS NATIONAL BANK",:state=>"NM", :account=>1040669301],
  [:title=>"Operating Engineers",:state=>"CA", :account=>1040678104],
  [:title=>"SCentral Bank",:state=>"TX", :account=>1040678300]
]

]
seed_data.each do |object|
  object.each do |name, values|
    unless name.capitalize.constantize.exists?
      name.capitalize.constantize.create(values)
    end
  end
end
