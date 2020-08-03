Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#root"


  namespace :api, defaults: {format: :json} do
    # CHECK: resource vs resources
    resource :user, only: [:create, :show]
    resource :session, only: [:create, :destroy]
  end
end

