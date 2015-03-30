Rails.application.routes.draw do

  resources :borrowers do
    resources :targets, shallow: true
  end

  resources :deals do
    resources :targets, shallow: true
    resources :documents
  end

  resources :targets do
    resources :agreements
    resources :trades
  end

  resources :lenders do
    resources :agreements
    resources :signers
  end

  resources :agreements
  resources :targets
  resources :trades

  
  get '/opportunities' => 'pages#opportunities', as: 'opportunities'
  get '/home' => 'pages#home', as: 'home'
  #get 'agreements/opportunities' => "agreements#opportunities"
  get 'targets/:id/allocation'=> "targets#allocation"
  post 'pages/agreement_confirmation'=> 'pages#agreement_confirmation'
devise_for :users
resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
  root 'pages#opportunities'

end
