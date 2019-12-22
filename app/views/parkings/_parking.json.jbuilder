json.extract! parking, :id, :symbol, :name, :address, :lat, :lon, :price, :memo, :managing_memo, :number, :empty_number, :status, :user_id, :created_at, :updated_at
json.url parking_url(parking, format: :json)
