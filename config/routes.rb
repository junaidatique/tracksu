Rails.application.routes.draw do

  namespace :tracksu do
    resources :places
  end
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'home/tour'
  get 'home/pricing'
  get 'home/about'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users do
        collection do
          post 'log_in'
          delete 'log_out'
          put 'update'
          post 'reset_password'
          post 'update_password'
        end
      end
      resources :activities, only: [:index, :create, :update, :destroy] do
        collection do
          put 'update'
          delete 'destroy'
        end
      end
    end
  end


  namespace :tracksu do
    resources :companies
    resources :products
    resources :purposes
    resources :activities
    resources :users do
      collection do
        get 'change_password'
        patch 'update_password'
      end
    end
  end

  resources :companies



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
