Rails.application.routes.draw do
  get "books/index"
  get "books/show"
  root "authors#index"
  get "authors/:id", to: "authors#show", id: /\d+/, as: "author"
  # %i means an array of symbols
  # resources "authors", only: %i[index, show]
  resources "books", only: %i[index show]
end
