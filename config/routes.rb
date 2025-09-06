Rails.application.routes.draw do
  resources :tasks, except: [:new, :edit] do
    resources :comments, only: [:create]
  end
end