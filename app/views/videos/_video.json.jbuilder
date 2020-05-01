json.extract! video, :id, :title, :file, :created_at, :updated_at
json.url video_url(video, format: :json)
