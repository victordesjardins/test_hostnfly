json.array! @missions.order(date: :asc) do |mission|
  json.extract! mission, :listing_id, :mission_type, :date, :price
end
