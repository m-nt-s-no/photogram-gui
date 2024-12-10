Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:username", {:controller => "users", :action => "show"})
  post("/insert_user", {:controller => "users", :action => "insert"})
  post("/update_user/:username", { :controller => "users", :action => "update" })

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photo_id", {:controller => "photos", :action => "index"})
end
