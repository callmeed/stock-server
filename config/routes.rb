Rails.application.routes.draw do

  ##
  # Messing around with Administrate but I don't think it's going
  # to play well with refile and our image uploading requirements
  # namespace :admin do
  #   DashboardManifest::DASHBOARDS.each do |dashboard_resource|
  #     resources dashboard_resource
  #   end
  #   root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  # end

  resources :images
  resources :sessions, only: [:create, :destroy]
  get 'grid' => 'welcome#grid', as: :browse_grid

  get 'license' => 'welcome#license'
  get 'terms'   => 'welcome#terms'
  get 'privacy' => 'welcome#privacy'
  get 'contact' => 'welcome#contact'
  post 'subscribe' => 'welcome#subscribe', as: :subscribe_user
  root 'welcome#index'

end
