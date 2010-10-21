ActionController::Routing::Routes.draw do |map|
  
  map.permalink '/page/:permalink/:language', 
    :controller => 'pages', :action => 'show', 
    :language => :language, :permalink => :permalink
  
  map.root :controller => :pages, :action => "show", :permalink => "home"
  map.resources :pages
  map.resources :contents, :belongs_to => :language
  map.resources :translations, :belongs_to => [:company, :category]
  map.resources :companies, :has_many => :translations
  map.resources :categories, :has_many => :translations
  map.resources :languages, :has_many => :contents
  map.resources :attachments
  map.resources :segments, :belongs_to => :document
  map.resources :documents, :has_many => :segments
  
  map.resources :users, :has_many => :documents
  map.resource :account, :controller => "users"
  map.resource :user_session
    
  map.login    "login",     :controller => "user_sessions", :action => "new"
  map.signin   "signin",    :controller => "user_sessions", :action => "new"
  map.logout   "logout",    :controller => "user_sessions", :action => "destroy"
  map.signup   "signup",    :controller => "users",     :action => "new"
  map.register "register",  :controller => "users",     :action => "new"
  map.user  "/user/:login", :controller => "users",     :action => "user", :user => :user
  
  # Admin home page
  map.admin "/admin", :controller => "admin/dashboard"
  # Admin dashboard
  map.connect '/dashboard/:action', :controller => "admin/dashboard"
  # Admin routes
  map.namespace :admin do |admin|
    admin.resources :attachments
    admin.resources :settings
    admin.resources :users
    admin.resources :pages
    admin.resources :languages
    admin.resources :comments
    admin.resources :companies, :has_many => :translations
    admin.resources :translations
    admin.resources :categories, :has_many => :translations
    admin.resources :segments, :members => :import
    admin.resources :user_types
  end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
