Todocanchas::Application.routes.draw do


  devise_for :users

  root :to => 'clubs#search'

  get "admin" => "admin/clubs#index"
  get "pruebas" => "clubs#pruebas"
  get "clubs/fetchByDepartment" => 'clubs#fetchByDepartment'


  namespace :admin do
    resources :clubs do
      resources :courts
    end
    resources :pictures, :only => [:index, :create, :destroy] 
  end



  resources :pictures, :only => [:index, :create, :destroy] 
  resources :clubs
  
  get "users/select_type" => "users#select_type", :as => 'select_user_type'
  get "admin/upload/:club_id" => "admin/pictures#upload", :as => "admin_upload"
  get "upload/:club_id" => "pictures#upload"
  get "departments/fetch"
  get "clubs/search"



end
