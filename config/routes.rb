Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do#トップページをログイン画面に
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :articles
  resources :sample_articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
