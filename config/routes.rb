Rails.application.routes.draw do

  get 'home/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }


  get '/', to: 'home#index', as: 'index'
  resources :store_requests
  get '/store_request/successful', to: 'store_requests#store_request_successful', as: 'store_request_successful'


  get '/api/shipping_addresses/fee', to: 'shipping_addresses#fee', as: 'shipping_addresses_fee'

  resources :stores, only: [:show], path: '/' do
    resources :orders, only: [:index, :show]

    resources :products, only: [:show]
    
    resource :cart, only: [:add_item, :show] do
      collection do
        post :add_item
      end

      resources :cart_items, only: [:destroy], path: '/items'
    end

    resources :categories, only: [:show]

  end
  get '/:id/checkout', to: 'carts#checkout', as: 'checkout'
  post '/:id/review_order', to: 'carts#review_order', as: 'review_order'
  post '/:id/place_order', to: 'orders#place_order', as: 'place_order'
  post '/shipping_addresses/', to: 'shipping_addresses#create', as: 'shipping_addresses'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
