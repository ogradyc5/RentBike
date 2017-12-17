json.array!(@cycles) do |cycle|
  json.extract! cycle, :id, :latitude, :longitude, :address
  json.url cycle_url(cycle, format: :json)
end
