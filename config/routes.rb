Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:username", {:controller => "users", :action => "show"})
  post("/insert_user", {:controller => "users", :action => "insert"})
  post("/update_user/:username", { :controller => "users", :action => "update" })

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photo_id", {:controller => "photos", :action => "show"})
  post("/insert_photo", {:controller => "photos", :action => "insert_photo"})
  post("/insert_comment", {:controller => "photos", :action => "insert_comment"})
  post("/update_photo/:id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:id", { :controller => "photos", :action => "delete" })
end
