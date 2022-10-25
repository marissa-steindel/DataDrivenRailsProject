Rails.application.routes.draw do
  root "authors#index"
  get "authors/:id", to: "authors#show", id: /\d+/, as: "author"

  # resources "authors", only: %i[index, show]
  # %i means an array of symbols
  resources "books", only: %i[index show]
  get "search", to: "books#search", as: "search"
end
