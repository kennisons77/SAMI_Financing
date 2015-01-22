json.array!(@targets) do |target|
  json.extract! target, :id, :amount, :yield, :borrower_id, :deal_id
  json.url target_url(target, format: :json)
end
