Rails.application.routes.draw do
    
    
    # Admin Routes
    authenticated :user, ->(user) { user.admin? } do
        get 'admin', to: 'admin#index'
        get 'admin/writings'
        get 'admin/questions'
        get 'admin/comments'
        get 'admin/users'
        get 'admin/show_writing'
        get 'admin/show_question/:id', to: 'admin#show_question', as: 'admin_question'
    end
    

    get 'users/profile'
    
    # Devise Auth Routes
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    # Routes for Readings
    resources :readings

    # Routes for Writings
    resources :writings do
        resources :corrections
    end

    # Routes for Questions
    resources :questions do
        resources :comments
    end

    resources :listenings


    # Routes for chatrooms
    resources :rooms do
        resources :messages
    end


    # Routes for Searchbar
    get 'search', to: "search#index"

    # About Page Route
    get 'about', to: 'pages#about'

    # User Profile Route
    get '/u/:id', to: 'users#show', as: 'user'

      
    # Defines the root path route ("/")
    root "pages#home"
end
