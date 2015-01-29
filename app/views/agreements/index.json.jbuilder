json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :amount, :fulfilled, :lender_id, :target_id
  json.url agreement_url(agreement, format: :json)
end
