Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de|fr/ do
    #Pages
    get 'pages/home'
    get 'pages/contact'
    get 'pages/tos'
    get '/faq' => 'pages#faq', as: :faq

    #Sign up
    get '/register' => 'users#new', as: :register

    #Orders
    get '/order' => 'orders#show', as: :order
    get '/order/validate/:id', to: 'orders#validate'
    get '/order/execute_payment/:type', to: 'orders#execute_payment', as: :execute_payment
    get '/order/create_payment/:type/:id_pack', to: 'orders#create_payment', as: :create_payment
    get '/order/:id', to: 'orders#show'

    #Support
    get '/support' => 'support#show', as: :support
    get '/support/ticket/delete/:id', to: 'support#delete_ticket'


    #Sessions
    get '/login', to: 'sessions#new', as: :login
    get '/logout', to: 'sessions#destroy', as: :logout

    #Ressources
    resources :sessions
    resources :users
    resources :orders

    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".
    # You can have the root of your site routed with "root"
    root 'pages#home'
  end


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
end
