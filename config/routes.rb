Blog::Application.routes.draw do

  devise_for :users

  #########get "comments/edit"

  root :to => 'posts#index'
  get '/posts/new',           :controller => :posts,         :action => :new,           :as => "new_post"
  get '/posts',               :controller => :posts,         :action => :index,         :as => "posts"
  post '/posts',               :controller => :posts,         :action => :create
  get '/posts/:id',           :controller => :posts,         :action => :show,          :as => "post" 
  get '/posts/edit/:id',     :controller => :posts,          :action => :edit,          :as => "edit_post"
  put '/posts/:id',           :controller => :posts,         :action => :update,         :as => "update"
  delete '/posts/:id',        :controller => :posts,         :action => :destroy        

  get '/posts/:id/comments/new',           :controller => :comments,         :action => :new,           :as => "new_comment"
  #test
  get '/posts/:id',                        :controller => :comments,         :action => :index,           :as => "index_comment"
  post '/posts/:id',                       :controller => :comments,         :action => :create
  delete '/posts/:id/comments/:idcomment', :controller => :comments,         :action => :destroy,        :as => "delete_comment"    
  get '/posts/:id/comments/edit/:idcomment', :controller => :comments,       :action => :edit,          :as => "edit_comment"
  put '/posts/:id/comments/:idcomment',                          :controller => :comments,       :action => :update,        :as => "update_comment"

  



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
