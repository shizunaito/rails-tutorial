json.(@user, :id, :name)

json.following @user.following.count
json.followers @user.followers.count

json.microposts @microposts do |micropost|
  json.(micropost, :id, :content, :created_at, :updated_at, :picture)
end
