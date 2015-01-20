json.array!(@targets) do |target|
  json.extract! target, :id, :amount, :fulfilled, :borrower_id, :deal_id
  json.url target_url(target, format: :json)
end
