Rails.application.routes.draw do
  get 'tests/new'
  get 'tests/edit'
  get 'tests/show'
  get 'tests/update'
  get 'tests/index'
  get 'tests/create'
  get 'tests/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true
  end
end
