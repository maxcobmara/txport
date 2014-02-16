json.array!(@acquired_types) do |acquired_type|
  json.extract! acquired_type, :short_name, :description
  json.url acquired_type_url(acquired_type, format: :json)
end
