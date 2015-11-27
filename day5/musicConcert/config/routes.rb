Rails.application.routes.draw do

  resources :concerts, only: [:new, :create, :index, :show] do
    resources :comments, only: [:create]
  end

end
