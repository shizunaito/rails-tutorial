json.microposts @microposts do |micropost|
  json.merge! micropost.slice(:user_id, :content)
end
