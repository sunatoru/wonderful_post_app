Rails.application.routes.draw do
  # root "articles#index"
  # get "/articles", to: "articles#index"
  #/articles/整数 のURIのアクセスしたら、articlesコントローラのshowアクションを実行する。
  # get "/articles/:id", to: "articles#show"

  resources :articles
  resources :sample_articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
