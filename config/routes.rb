Learnmaze::Application.routes.draw do


  get "select_community/index"

  resources :departments


 # get "comments/index"

  #get "comments/new"

  resources :memberships, only: [:create, :destroy]




  resources :communities



  get "search/search"
  post "search/search"


  match 'search/search' => 'search#search', :as => :search_search


 # get "profile/show"

  get "profile/view"

  get "specs/index"

  get "specs/edit"
  post "specs/edit"

  get "home/index"

  get "home/show"

  authenticated :user do

    root :to => "profile#view"
  end


  devise_for :users,:controllers => { :omniauth_callbacks => "users/omniauth_callbacks" ,:registrations => "registrations"}


  devise_scope :user do
    #match 'auth/:provider/callback' => 'devise/sessions#create'
    #match 'auth/failure', to: redirect('/')
    #match 'signout'=> 'devise/sessions#destroy', as: 'signout'



  end

  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'

    #get "facebook" => 'devise/external#index', as: 'facebook'
    #post "facebook " => "devise/external#create"
  end


  #resources :profile

  match "profile/:id" => "profile#show"

  get "friendship/req"
  post "friendship/req"

  get "friendship/accept"
  get "friendship/reject"

  resources :microposts do
    resources :comments
  end

  resources :feed_entries do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]


  get "external/index"
  get "external/linkedin"
  post "/external" => "external#create"


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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
