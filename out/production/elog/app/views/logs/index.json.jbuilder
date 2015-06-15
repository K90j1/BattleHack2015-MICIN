json.array!(@logs) do |log|
  json.extract! log, :id, :type, :log, :resolve
  json.url log_url(log, format: :json)
end
