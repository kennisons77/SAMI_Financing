json.array!(@signers) do |signer|
  json.extract! signer, :id, :lender_id, :first, :last, :email, :active
  json.url signer_url(signer, format: :json)
end
