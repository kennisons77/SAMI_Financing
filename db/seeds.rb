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
    if name.capitalize.constantize..count.zero?
      name.capitalize.constantize.create(values)
    end
  end

  new_data = Hash.new({
    :Trade=> {
      :cols =>
      ["trade_date", "settlement_date", "buy", "cusip", "pool", "coupon", "original_face", "current_face", "factor", "price", "market_value", "interest", "total_mv_wac", "margin_mv", "cash"],
      :data =>
      [
        ["2014 ,11, 26", "2014 ,12, 18", 1, "83164GXS6", "SBA # 506089", "0.04", "2000000.00", "198944.50", "0.10", "106.00", "210881.17", "340.55", "211221.72", "202770.36", "200000.00"],
        ["2014 ,11, 26", "2014 ,12, 18", 0, "83165AQ72", "SBA # 522078", "0.05", "-1000000.00", "-984331.19", "0.98", "114.75", "-1129520.04", "-2156.31", "-1131676.35", "-1086076.96", "-1080000.00"],
        ["2014 ,12, 5", "2014 ,12, 18", 0, "83165ALX0", "SBA # 521942", "0.04", "-2000000.00", "-1707776.56", "0.85", "115.88", "-1978886.09", "-3371.77", "-1982257.86", "-1902775.09", "-1900000.00"],
        ["2014 ,12, 9", "2014 ,12, 18", 0, "83165ARE6", "SBA # 522085", "0.04", "-7900000.00", "-7755974.47", "0.98", "112.69", "-8740013.73", "-14650.17", "-8754663.90", "-8403859.35", "-8400000.00"],
        ["2014 ,12, 10", "2014 ,12, 18", 0, "83165ART3", "SBA # 522098", "0.04", "-1000000.00", "-997926.88", "1.00", "115.38", "-1151358.14", "-1692.23", "-1153050.37", "-1107075.13", "-1100000.00"]
      ]
    }
  })
  target = Target.find(2)
  new_data.each do |table,col_data|
    if table.to_s.constantize.count.zero?
      col_data[:data].each do |row|
        hash= Hash[*col_data[:cols].zip(row).flatten]
        hash.each do |k,v|
          hash[k] = Datetime.new(v) if k.to_s.include? "_date"
        end
        obj = table.to_s.constantize.create(hash)
        obj.target_id = target.id
        obj.inspect
      end
    end
  end

end