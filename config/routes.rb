Rails.application.routes.draw do

  get 'items/autocomplete', to: 'items#autocomplete', as: 'autocomplete_items'
  resources :items

  resources :inventories do
    delete 'remove_item/:item_id', to: 'inventories#remove_item', as: 'remove_item'
    post 'track_item', to: 'inventories#track_item', as: 'track_item'

    post 'update_stock', to: 'inventories#update_stock', as: 'update_stock'
  end
  # get 'inventory', to: 'inventory#index', as: 'inventory'

  resources :tasks
  get 'new_task', to: 'tasks#new'

  resources :shifts
  get 'new_shift', to: 'shifts#new'

  get 'login', to: 'login#new_session', as: 'login'

  get 'signup', to: 'login#signup', as: 'signup'
  get 'login/new_session'
  post 'create_session', to: 'login#create_session', as: 'create_session'
  delete 'logout', to: 'login#destroy_session', as: 'logout'


  get 'developer', to: 'developer#index'
  resources :developer_log_entries

  resources :plants

  resources :games, only: :index
  get 'games/tic_tac_toe'
  get 'games/hi_lo'
  get 'games/hundred_puzzle'
  get 'games/plane_of_worlds'
  get 'open_portal_path/:direction', to: 'games#open_portal', as: 'open_portal'
  get 'travel_portal_path/:direction', to: 'games#travel_portal', as: 'travel_portal'
  resources :worlds

  resources :purchases
  delete 'purchases/:id/remove_purchase_link', to: 'purchases#remove_purchase_link', as: 'remove_purchase_link'

  resources :courses

  get 'courses/:course_id/assignments', to: 'assignments#index', as: 'assignments'
  get 'courses/:course_id/assignments/new', to: 'assignments#new', as: 'new_assignment'
  resources :assignments, except: [:index, :new]


  resources :issues

  resources :users

  get 'admin_new_user', to: 'users#admin_new', as: 'admin_new_user'
  post 'admin_create_user', to: 'users#admin_create', as: 'admin_create_user'
  get 'my_profile', to: 'users#my_profile', as: 'my_profile'

  # get 'signup', to: 'users#new', as: 'signup'
  # get 'login', to: 'sessions#new', as: 'login'
  # delete 'logout', to: 'sessions#destroy', as: 'logout'


  resources :sessions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'welcome' => 'welcome#index', as: :welcome

  get 'not_allowed' => 'users#not_allowed', as: :not_allowed

  post 'toggle_header', to: 'user_settings#toggle_header', as: 'toggle_header'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  match '*path', to: redirect('/'), via: :all

end
