json.array!(@inden_usages) do |inden_usage|
  json.extract! inden_usage, :inden_card_id, :petrol_ltr, :petrol_price, :diesel_ltr, :diesel_price, :issue_date
  json.url inden_usage_url(inden_usage, format: :json)
end
