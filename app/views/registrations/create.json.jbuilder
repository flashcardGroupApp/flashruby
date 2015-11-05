json.user do
  json.full_name @user.full_name
  json.email @user.email
  json.username @user.username
  json.access_token @user.access_token

end

