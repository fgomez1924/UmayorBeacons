Rails.application.routes.draw do
  get 'envio_ftp/EnvioFtp'

  get 'dash_board/Index'
  get 'contacto/Contacto'
  
  resources "contacto", only: [:new, :create, :contacto]
  
  get "envio_ftp/upload"
  post "envio_ftp/upload"

  
  get 'login/Login'
  get 'login/redireccion'
  post "login/inicio_sesion"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
