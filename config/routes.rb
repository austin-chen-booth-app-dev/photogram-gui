Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  # Users Endpoints
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "get_specific_user" })

  # Photos Endpoints
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "get_user_photos" })
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo" })

  # Comments Endpoints
  get("/insert_comment_record/:photo_id", { :controller => "comments", :action => "insert_comment_record"})
end
