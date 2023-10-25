Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :todo_tasks
  resource :users do
    collection do
      post :update_todo_order
    end
  end
end
