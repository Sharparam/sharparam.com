json.array!(@categories) do |category|
  json.extract! category, :id, :name, :html_class
  json.url category_url(category, format: :json)
end
