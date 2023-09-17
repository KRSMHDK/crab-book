Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root "home#index"
  resources :books
  resources :authors

  get '/get_books_data', to: 'books#get_data'
  get '/table_style', to: 'books#table'
  get '/my_books', to: 'books#my_books'
end
