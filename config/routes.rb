Rails.application.routes.draw do

require 'sidekiq/web'
mount Sidekiq::Web => "/sidekiq"
 get :user_profiles, to: redirect("/blogs")

  resources :labs
  resources :articles
  resources :user_profiles
  resources :users

  resources :blogs do
  	collection do 
  		get 'search'
    end
    member do
    	get 'current_blog'
    end
  end

  get 'こんにちは', to: 'blogs#index', defaults: { format: 'json' }




  match '/all_blogs',to:'blogs#index', via: [:get,:post]
  

  get 'my_articles', to: 'articles#index'
  get 'all_articles', controller: 'articles',action: 'index'

  namespace "admin" do 
  	resources :courses
  end

   concern :all_comments do 
	   resources :comments 
    end

   resources :articles,concerns: :all_comments

   resources :blogs,concerns: :all_comments


   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
