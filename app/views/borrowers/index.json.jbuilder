json.array!(@borrowers) do |borrower|
  json.extract! borrower, :id, :title
  json.url borrower_url(borrower, format: :json)
end
