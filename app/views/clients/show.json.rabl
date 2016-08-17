object @client
attributes :id, :name, :company, :email
node(:edit_url) {|client| client_url(client)}


if current_user.role == "user"
   child :user do
      attributes :id, :email
 end
end

child :projects do
  attributes :id, :name, :start_date, :status
  node(:show_url) {|project| project_url(project)}
 end