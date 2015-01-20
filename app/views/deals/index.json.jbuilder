json.array!(@deals) do |deal|
  json.extract! deal, :id, :collateral, :term
  json.url deal_url(deal, format: :json)
end
