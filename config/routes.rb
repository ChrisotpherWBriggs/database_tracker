Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'show' => 'home#show', as: 'show'
  get 'acresult' => 'home#acresult', as: 'acresult'
  get 'edit' => 'home#edit', as: 'edit'  
  get 'deletenull' => 'home#deletenull', as: 'deletenull' 
  post 'update' => 'home#update', as: 'update'
  post 'new' =>	'home#new', as: 'new'
  post 'delete' => 'home#delete', as: 'delete'
  
  
  get 'wellmont' => 'wellmont#wellmont', as: 'wellmont'
  get 'wellshow' => 'wellmont#wellshow', as: 'wellshow'
  get 'wellacresult' => 'wellmont#wellacresult', as: 'wellacresult'
  
  get 'archive' => 'archive#archive', as: 'archive'
  get 'search2016' => 'archive#search2016', as: 'search2016'
  get 'search2017' => 'archive#search2017', as: 'search2017'
  get 'show2016' => 'archive#show2016', as: 'show2016'
  get 'acresult2016' => 'archive#acresult2016', as: 'acresult2016'
  get 'show2017' => 'archive#show2017', as: 'show2017'
  get 'acresult2017' => 'archive#acresult2017', as: 'acresult2017'


  get 'signup'  => 'users#new' 
  post 'signup' => 'users#create'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'
end
