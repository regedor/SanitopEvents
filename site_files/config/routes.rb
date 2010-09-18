ActionController::Routing::Routes.draw do |map|

  map.root :controller => "clientes", :action => "new"
  map.resources :convidados
  map.resources :clientes
  map.sucess 'sucess', :controller => "clientes", :action => "sucess"

end
