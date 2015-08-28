json.array!(@factorialls) do |factoriall|
  json.extract! factoriall, :id, :n, :result
  json.url factoriall_url(factoriall, format: :json)
end
