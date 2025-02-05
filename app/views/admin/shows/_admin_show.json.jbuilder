json.extract! admin_show, :id, :venue, :date, :description, :image, :created_at, :updated_at
json.url admin_show_url(admin_show, format: :json)
