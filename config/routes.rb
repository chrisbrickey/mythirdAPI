Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #creating todo resource with a nested items resource, enforcing 1:many assocations at the routing level
  resources :todos do
    resources :items
  end
end
