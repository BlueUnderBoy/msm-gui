Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/insert_director", {:controller => "directors", :action => "create"})
  get("/update_director/:path_id", {:controller => "directors", :action => "update"})
  get("/delete_director/:path_id", {:controller => "directors", :action => "destroy"})
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/insert_movie", {:controller => "movies", :action => "create"})
  get("/update_movie/:path_id", {:controller => "movies", :action => "update"})
  get("/delete_movie/:path_id", {:controller => "movies", :action => "destroy"})
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
