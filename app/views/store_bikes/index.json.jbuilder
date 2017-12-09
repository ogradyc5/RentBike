json.array!(@store_bikes) do |store_bike|
  json.extract! store_bike, :id, :store_id, :bike_id
  json.url store_bike_url(store_bike, format: :json)
end
