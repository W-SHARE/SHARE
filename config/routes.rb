Rails.application.routes.draw do
  post "/users/:id/update" => "users#update"
  get "/users/:id/edit" => "users#edit"
  post "/users/create" => "users#create"
  get "/users/index" => "users#index"
  get '/signup' => "users#new"
  get "/users/:id" => "users#show"
  get "courses/index" => "courses#index"
  get "labs/index" => "labs#index"
  get 'requests/new'
  get '/' => "home#top"
  get "/about" => "home#about"
  get 'courses/:course_id' => "courses#show"
  get 'labs/:lab_id' => "labs#show"
  get 'review_labs/:lab_id/new' => "review_labs#new"
  get "review_courses/:course_id/new" => "review_courses#new"
  post "review_labs/:lab_id/create" => "review_labs#create"
  post "review_courses/:course_id/create" => "review_courses#create"
  post "/requests/create" => "requests#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
