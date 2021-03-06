Eshop::Application.routes.draw do

  get "tag/list"
  match 'tag/list/:id' => 'tag#list'
  get "tag/show"
  match 'tag/show/:id' => 'tag#show'

  root to: 'catalog#index'

  match 'catalog' => 'catalog#index'
  match 'about' => 'about#index'
  match 'admin/supplier' => 'admin/supplier#index'
  match 'admin/brand' => 'admin/brand#index'
  match 'admin/product' => 'admin/product#index'

  get 'catalog/show'
  match 'catalog/show/:id' => 'catalog#show'
  get 'catalog/index'
  get 'catalog/latest'
  get 'catalog/search'
  get 'catalog/rss'

  get 'admin/supplier/new'
  post 'admin/supplier/create'
  get 'admin/supplier/edit'
  match 'admin/supplier/edit/:id' => 'admin/supplier#edit'
  post 'admin/supplier/update'
  post 'admin/supplier/destroy'
  get 'admin/supplier/show'
  match 'admin/supplier/show/:id' => 'admin/supplier#show'
  get 'admin/supplier/index'

  get 'admin/brand/new'
  post 'admin/brand/create'
  get 'admin/brand/edit'
  match 'admin/brand/edit/:id' => 'admin/brand#edit'
  post 'admin/brand/update'
  post 'admin/brand/destroy'
  get 'admin/brand/show'
  match 'admin/brand/show/:id' => 'admin/brand#show'
  get 'admin/brand/index'

  get 'admin/product/new'
  post 'admin/product/create'
  get 'admin/product/edit'
  match 'admin/product/edit/:id' => 'admin/product#edit'
  post 'admin/product/update'
  post 'admin/product/destroy'
  get 'admin/product/show'
  match 'admin/product/show/:id' => 'admin/product#show'
  get 'admin/product/index'

  get 'cart/add'
  post 'cart/add'
  match 'cart/add/:id' => 'cart#add'
  get 'cart/remove'
  post 'cart/remove'
  match 'cart/remove/:id' => 'cart#remove'
  get 'cart/clear'
  post 'cart/clear'

  match 'checkout' => 'checkout#index'
  get 'checkout/index'
  post 'checkout/submit_order'
  get 'checkout/thank_you'

  match 'admin/order' => 'admin/order#index'
  post 'admin/order/close'
  get 'admin/order/show'
  match 'admin/order/show/:id' => 'admin/order#show'
  get 'admin/order/index'

  get 'user_session/new'
  post 'user_session/create'
  get 'user_session/destroy'
  get 'user_session/forgot_password'
  post 'user_session/forgot_password'
  get 'user_session/reset_password'
  post 'user_session/reset_password'

  get 'user/new'
  post 'user/create'
  get 'user/show'
  match 'user/show/:id' => 'user#show'
  get 'user/edit'
  post 'user/update'

end
