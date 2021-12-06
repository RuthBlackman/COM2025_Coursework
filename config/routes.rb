Rails.application.routes.draw do

  resources :selected_modules, except: [:index]
  devise_for :users
  resources :course_modules

  root 'home#home'

  get 'response' , to: 'home#responsive'
  get 'contact' , to: 'home#contact'
  post 'request_contact' , to: 'home#request_contact'
  get 'my_modules' , to: 'course_modules#indexOwn'
  get 'selected_modules', to: 'course_modules#indexOwn'
  #get 'course_modules/new', to: 'course_modules#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
