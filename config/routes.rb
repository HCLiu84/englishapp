Rails.application.routes.draw do

  devise_for :users
  get 'page/home'
  post '/home' => 'page#addtag', :as => "addtag"
  delete '/home.:tag' => 'page#removetag', :as => "removetag"
  root 'page#home'

end
