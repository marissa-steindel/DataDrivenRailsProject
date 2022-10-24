Rails.application.routes.draw do
  root "authors#index"
  get "authors/:id", to: "authors#show", id: /\d+/, as: author
end
