Rails.application.routes.draw do
  devise_for :users
  root   'tweets#index'                     #ルートパスの指定
  resources :tweets do
    resources :comments, only: [:create]
  end #tweets_controllerに対してのresourcesメソッド
      #tweets_controllerのルーティングの中にcomments_controllerのルーティングを記述することで、commentsのルーティングパスの中にコメントに結びつくツイートのid情報が含まれるようになる
      #コメントは作る(create)ので、createのみのアクションを適用
  resources :users, only: [:show] #users_controllerに対してのresourcesメソッド

  # get    'tweets'       => 'tweets#index'   #ツイート一覧表示
  # get    'tweets/new'   => 'tweets#new'     #ツイート投稿画面
  # post   'tweets'       => 'tweets#create'  #ツイート投稿機能
  # get    'users/:id'    => 'users#show'     #Mypageへのルーティング
  # delete 'tweets/:id'   => 'tweets#destroy' #ツイート削除機能
  # patch  'tweets/:id'   => 'tweets#update'  #ツイート更新機能
  # get    'tweets/:id/edit' => 'tweets#edit' #ツイート編集画面
  # get    'tweets/:id'   => 'tweets#show'    #ツイート詳細画面
end
