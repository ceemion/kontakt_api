Rails.application.routes.draw do
  devise_for :users, only: []
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json }, constraints: { :id => /[0-9]+(\%7C[0-9]+)*/ }, except: [:new, :edit] do
    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end
end
