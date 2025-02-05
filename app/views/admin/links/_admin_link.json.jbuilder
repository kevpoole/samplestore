json.extract! admin_link, :id, :name, :url, :created_at, :updated_at
json.url admin_link_url(admin_link, format: :json)
