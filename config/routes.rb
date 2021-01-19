Rails.application.routes.draw do
 
  resources :posts
  resources :destinations
  resources :bloggers

  patch '/posts/:id/like', to: 'posts#like', as: 'like_post'

  
end
