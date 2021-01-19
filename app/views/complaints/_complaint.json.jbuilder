json.extract! complaint, :id, :title, :content, :category, :company, :user_id, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
