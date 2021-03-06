Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Spree::Core::Engine.add_routes do
    # Routes to different categories
    get '/special-deals', to: 'products#special_deals', as: :special_deals
    patch '/order/remove_item', to: 'orders#remove_item', as: :remove_item
    scope :categories do
      get '/:category', to: 'home#show', as: :category
      get '/:category/:package_name', to: 'packages#show', as: :package

      post '/:category/:id', to: 'packages#add', as: :add_package
      post '/:category/customized/:package_name', to: 'packages#add_customized', as: :add_customized_package
    end
  end
end
