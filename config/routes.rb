Rails.application.routes.draw do
  root "authors#index"
  get 'about', to: "books#about"
  resources "authors", only: [:index, :show]
  # resources "publishers", only: [:index, :show]
  # resources "countries", only: [:index, :show]

  resources "books", only: [:index, :show] do
    collection do
      get 'search_results'
    end
  end
end
