json.extract! tracksu_user, :id, :name, :email, :activated, :created_at, :updated_at
json.url tracksu_user_url(tracksu_user, format: :json)