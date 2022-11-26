Rails.application.routes.draw do
  #ルーティングがusersなのにコントローラーアクション名が作成時のdiviseになっていたため、綺麗にusersで整えるために記述
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  get '/mypage', to: 'mypage#show'
  resources :articles
  root 'articles#index'
end
