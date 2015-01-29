json.array!(@lenders) do |lender|
  json.extract! lender, :id, :title, :account, :active
  json.url lender_url(lender, format: :json)
end
