Rails.application.routes.draw do
    resources :prompts
    
    
    # Admin Routes
    authenticated :user, ->(user) { user.admin? } do
        get 'admin', to: 'admin#index'
        get 'admin/writings'
        get 'admin/questions'
        get 'admin/readings'
        get 'admin/comments'
        get 'admin/prompts'
        get 'admin/listenings'
        get 'admin/users'
        get 'admin/show_writing/:id', to: 'admin#show_writing', as: 'admin_writing'
        get 'admin/show_question/:id', to: 'admin#show_question', as: 'admin_question'
        get 'admin/show_reading/:id', to: 'admin#show_reading', as: 'admin_reading'
        get 'admin/show_prompt/:id', to: 'admin#show_prompt', as: 'admin_prompt'
        get 'admin/show_listening/:id', to: 'admin#show_listening', as: 'admin_listening'
    end
    

    get 'users/profile'
    
    # Devise Auth Routes
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    # Routes for Readings
    resources :readings do
        resources :reading_problems
    end

    # Routes for Writings
    resources :writings do
        resources :corrections
    end

    # Routes for Questions
    resources :questions do
        resources :comments
    end

    resources :listenings do
        resources :listening_options
    end


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
