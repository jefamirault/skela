Rails.application.routes.draw do

  resources :courses do
    member do
      get 'activate', to: 'courses#activate_course'
    end
  end

  resources :assignments do
    member do
      post 'add_resource', to: 'assignments#add_resource', as: 'add_resource'
      post 'remove_resource', to: 'assignments#remove_resource', as: 'remove_resource'
    end
  end

  resources :readings do
    member do
      post 'add_resource', to: 'readings#add_resource', as: 'add_resource'
      post 'remove_resource', to: 'readings#remove_resource', as: 'remove_resource'
    end
  end

  resources :exams do
    member do
      post 'add_resource', to: 'exams#add_resource', as: 'add_resource'
      post 'remove_resource', to: 'exams#remove_resource', as: 'remove_resource'
    end
  end

  get 'resources/autocomplete'
  resources :resources do
    member do
      delete 'remove_file', to: 'resources#remove_file', as: 'remove_file'
    end
  end
  
  resources :trackers

  resources :sounds

  get 'calculators/budget'
  get 'calculators/tip'

  post 'quests/:id/new_challenge', to: 'quests#new_challenge', as: 'quests_new_challenge'
  get 'quests/:id/play', to: 'quests#play', as: 'play_quest'
  resources :quests

  post 'quests/:id/attempt_challenge/:challenge_id', to: 'quests#attempt_challenge', as: 'attempt_challenge'
  resources :challenges


  get 'items/autocomplete', to: 'items#autocomplete', as: 'autocomplete_items'
  resources :items

  resources :inventories do
    delete 'remove_item/:item_id', to: 'inventories#remove_item', as: 'remove_item'
    post 'track_item', to: 'inventories#track_item', as: 'track_item'

    post 'update_stock', to: 'inventories#update_stock', as: 'update_stock'
  end

  get 'tasks/autocomplete', to: 'tasks#autocomplete', as: 'autocomplete_tasks'
  resources :tasks
  get 'new_task', to: 'tasks#new'

  resources :shifts
  get 'new_shift', to: 'shifts#new'

  get 'login', to: 'login#new_session', as: 'login'

  get 'signup', to: 'login#signup', as: 'signup'
  get 'login/new_session'
  post 'create_session', to: 'login#create_session', as: 'create_session'
  delete 'logout', to: 'login#destroy_session', as: 'logout'
  get 'logout', to: 'login#destroy_session'

  resources :log_entries

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


  resources :issues do
    delete 'remove_task/:task_id', to: 'issues#remove_task', as: 'remove_task'
    post 'new_task'
    post 'add_task', to: 'issues#add_task', as: 'add_task'
  end

  get 'users/autocomplete', to: 'users#autocomplete', as: 'autocomplete_users'
  resources :users
  post 'change_avatar_face', to: 'avatars#change_face'
  post 'change_avatar_head', to: 'avatars#change_head'
  post 'change_avatar_color', to: 'avatars#change_color'


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
  root 'courses#index'

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
