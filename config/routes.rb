Rails.application.routes.draw do
  resources :selected_modules
  devise_for :users
  resources :course_modules
  get 'my_modules' , to: 'course_modules#indexOwn'
  root 'home#home'
  get 'response' , to: 'home#responsive'
  get 'contact' , to: 'home#contact'
  post 'request_contact' , to: 'home#request_contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
