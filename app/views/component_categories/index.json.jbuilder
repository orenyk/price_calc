json.array!(@component_categories) do |component_category|
  json.extract! component_category, :id, :name
  json.url component_category_url(component_category, format: :json)
end
