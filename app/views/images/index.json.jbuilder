json.array!(@images) do |image|
  json.extract! image, :id, :title, :description, :status, :attachment_id, :attachment_size, :attachment_content_type, :license_id, :metadata
  json.url image_url(image, format: :json)
end
