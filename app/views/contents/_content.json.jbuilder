json.extract! content, :id, :title, :comment, :created_at, :updated_at
json.url content_url(content, format: :json)
