json.(@user, :id, :name)
json.decode @decode_token

json.following @user.following.count
json.followers @user.followers.count

json.microposts @microposts do |micropost|
  json.merge! micropost.attributes.except('user_id')
end
