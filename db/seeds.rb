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
    [ :collateral =>"SBA 7a Pools",:term => 0,:status=>0],
    [ :collateral =>"SBA 7a Pools",:term => 1,:status=>0],
    [ :collateral =>"SBA 7a Loans",:term => 2,:status=>0],
    [ :collateral =>"FH/FN Bank-eligible MBS",:term => 1,:status=>0],
    [ :collateral =>"FH/FN Bank-eligible MBS",:term => 2,:status=>0],
    [ :collateral =>"QM Residential Mortgage Loans",:term => 2,:status=>0],
  ],
  "Lender" => [
    [:title=>"SELECT BANK & TRUST",:state=>"NC", :account=>1040676909],
    [:title=>"FIRST NATIONAL BANK",:state=>"TX", :account=>1040667704],
    [:title=>"LOS ALAMOS NATIONAL BANK",:state=>"NM", :account=>1040669301],
    [:title=>"Operating Engineers",:state=>"CA", :account=>1040678104],
    [:title=>"SCentral Bank",:state=>"TX", :account=>1040678300]
  ],
  "Target" => [
    [:yield=>"0.70",:borrower_id=>0,:deal_id=>0,:amount_cents=>1000000000,:status=>0],
    [:yield=>"0.80",:borrower_id=>0,:deal_id=>1,:amount_cents=>500000000,:status=>0],
    [:yield=>"1.50",:borrower_id=>0,:deal_id=>2,:amount_cents=>500000000,:status=>0],
    [:yield=>"0.70",:borrower_id=>1,:deal_id=>1,:amount_cents=>500000000,:status=>0],
    [:yield=>"0.50",:borrower_id=>1,:deal_id=>3,:amount_cents=>1000000000,:status=>0],
    [:yield=>"0.55",:borrower_id=>1,:deal_id=>4,:amount_cents=>500000000,:status=>0],
    [:yield=>"1.50",:borrower_id=>2,:deal_id=>5,:amount_cents=>500000000,:status=>0],
  ],
  "Trade" => [
    [:trade_date =>  Date.strptime("2014,11,26", "%Y,%m,%d"), :settlement_date =>  Date.strptime("2014,12,18", "%Y,%m,%d"), :buy => 1, :cusip => "83164GXS6", :pool => "SBA # 506089", :coupon => "0.04", :original_face => "2000000.00", :current_face => "198944.50", :factor => "0.10", :price => "106.00", :market_value => "210881.17", :interest => "340.55", :total_mv_wac => "211221.72", :margin_mv => "202770.36", :cash =>"200000.00"],
    [:trade_date =>  Date.strptime("2014,11,26", "%Y,%m,%d"), :settlement_date =>  Date.strptime("2014,12,18", "%Y,%m,%d"), :buy => 0, :cusip => "83165AQ72", :pool => "SBA # 522078", :coupon => "0.05", :original_face => "-1000000.00", :current_face => "-984331.19", :factor => "0.98", :price => "114.75",  :market_value =>"-1129520.04", :interest => "-2156.31", :total_mv_wac => "-1131676.35", :margin_mv => "-1086076.96", :cash =>"-1080000.00"],
    [:trade_date =>  Date.strptime("2014,12,5", "%Y,%m,%d"), :settlement_date =>  Date.strptime("2014,12,18", "%Y,%m,%d"), :buy => 0, :cusip => "83165ALX0", :pool => "SBA # 521942", :coupon => "0.04", :original_face => "-2000000.00", :current_face => "-1707776.56", :factor => "0.85", :price => "115.88",  :market_value =>"-1978886.09", :interest => "-3371.77", :total_mv_wac => "-1982257.86", :margin_mv => "-1902775.09", :cash =>"-1900000.00"],
    [:trade_date =>  Date.strptime("2014,12,9", "%Y,%m,%d"), :settlement_date =>  Date.strptime("2014,12,18", "%Y,%m,%d"), :buy => 0, :cusip => "83165ARE6", :pool => "SBA # 522085", :coupon => "0.04", :original_face => "-7900000.00", :current_face => "-7755974.47", :factor => "0.98", :price => "112.69",  :market_value =>"-8740013.73", :interest => "-14650.17", :total_mv_wac => "-8754663.90", :margin_mv => "-8403859.35", :cash =>"-8400000.00"],
    [:trade_date =>  Date.strptime("2014,12,10", "%Y,%m,%d"), :settlement_date =>  Date.strptime("2014,12,18", "%Y,%m,%d"), :buy => 0, :cusip => "83165ART3", :pool => "SBA # 522098", :coupon => "0.04", :original_face => "-1000000.00", :current_face => "-997926.88", :factor => "1.00", :price => "115.38",  :market_value =>"-1151358.14", :interest => "-1692.23", :total_mv_wac => "-1153050.37", :margin_mv => "-1107075.13", :cash =>"-1100000.00"]
  ]
    
]
seed_data.each do |object|
  object.each do |name, values|
    if name.capitalize.constantize.count.zero?
      name.capitalize.constantize.create(values)
    end
  end

end