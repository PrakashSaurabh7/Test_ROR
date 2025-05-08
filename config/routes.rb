Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "authors#new"
  post "author/add" => "authors#create"
  get "author/showAll", to: "authors#showAll"
  get "author/edit/:id", to: "authors#edit"
  patch "author/update/:id" => "authors#update"
  delete "author/delete/:id" => "authors#delete"
  get "authors/:id" => "authors#authors"

  get "book/new" => "books#new"
  get "book/showAll" => "books#showAll"
  post "book/add" => "books#create"
  get "book/edit/:id" => "books#edit"
  patch "book/update/:id" => "books#update"
  delete "book/delete/:id" => "books#delete"
  get "books/:id" => "books#books"
end
