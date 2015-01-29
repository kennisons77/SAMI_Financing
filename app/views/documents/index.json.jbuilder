json.array!(@documents) do |document|
  json.extract! document, :id, :deal_id, :type, :title, :url
  json.url document_url(document, format: :json)
end
