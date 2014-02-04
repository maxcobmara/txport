json.array!(@expertises) do |expertise|
  json.extract! expertise, :short_name, :name, :branch
  json.url expertise_url(expertise, format: :json)
end
