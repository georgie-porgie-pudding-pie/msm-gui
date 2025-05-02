Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/new_director", { :controller => "directors", :action => "new_item" })
  post("/update_director", { :controller => "directors", :action => "update_item" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete_item" })

  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/new_movie", { :controller => "movies", :action => "new_item" })
  post("/update_movie", { :controller => "movies", :action => "update_item" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete_item" })

  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/new_actor", { :controller => "actors", :action => "new_item" })
  post("/update_actor", { :controller => "actors", :action => "update_item" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete_item" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
