json.array!(@bank_details) do |bank_detail|
  json.extract! bank_detail, :id, :user_id, :account_no, :bank_name
  json.url bank_detail_url(bank_detail, format: :json)
end
