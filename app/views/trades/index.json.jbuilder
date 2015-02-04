json.array!(@trades) do |trade|
  json.extract! trade, :id, :trade_date, :settlement_date, :buy, :cusip, :pool, :coupon, :original_face, :current_face, :factor, :price, :market_value, :interest, :total_mv_wac, :margin_mv, :cash, :target_id
  json.url trade_url(trade, format: :json)
end
