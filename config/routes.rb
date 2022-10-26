Rails.application.routes.draw do
  root "authors#index"
  resources "authors", only: [:index, :show]
  resources "books", only: [:index, :show] do
    collection do
      get 'search_results'
    end
  end
  get 'about', to: "books#about"
end
