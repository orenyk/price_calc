json.array!(@components) do |component|
  json.extract! component, :id, :name, :price, :price
  json.url component_url(component, format: :json)
end
