Rails.application.routes.draw do
  get 'welcome/index'
  resources :employees
  root 'welcome#index'
end
