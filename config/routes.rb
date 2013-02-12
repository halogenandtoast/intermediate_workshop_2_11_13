Shouter::Application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show'
  end
  root to: "home#show", via: :get
  resource :dashboard, only: :show
  resources :text_shouts, only: :create
  resources :photo_shouts, only: :create
  resources :users, only: :show

  post ":user_id/follow" => "following_relationships#create", as: :user_follow
end
