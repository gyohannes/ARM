json.extract! event, :id, :year, :name, :description, :status, :created_at, :updated_at
json.url event_url(event, format: :json)
