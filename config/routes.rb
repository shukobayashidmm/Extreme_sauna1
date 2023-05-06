Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
end

devise_scope :admin do
    get '/admin/sign_out' => 'admin/sessions#destroy'
end

root to: "public/homes#top"

#マイページ
delete '/public/users/destroy' => 'public/users#destroy'
get '/public/users/my_page' => 'public/users#show'
get '/public/users/infomation/edit' => 'public/users#edit'
patch '/public/users/infomation' => 'public/users#update'
get '/public/users/unsubscribe' => 'public/users#unsubscribe'

#会員一覧
get 'admin/users' => 'admin/users#index'
get 'admin/users/:id' => 'admin/users#show', as: :admin_users_show
get 'admin/users/:id/edit' => 'admin/users#edit', as: :admin_users_edit
patch '/admin/users/:id' => 'admin/users#update', as: :admin_users_update
delete '/admin/users/:id' => 'admin/users#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
