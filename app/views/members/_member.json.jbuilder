json.extract! member, :id, :name, :url_long, :url_short, :created_at, :updated_at
json.url member_url(member, format: :json)
