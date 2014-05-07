Spree::Core::Engine.routes.draw do
  namespace :admin do
    namespace :inventory_sync do
      resources :imports, only: [:index, :show, :create]
    end
  end
end
