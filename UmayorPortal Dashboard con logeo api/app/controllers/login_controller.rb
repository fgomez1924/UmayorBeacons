class LoginController < ApplicationController
  def inicio_sesion
    if request.post?
      @user = params[:user]
      if(login(@user["email"],@user["pass"]))
        redirect_to :controller => "login", :action => "redireccion";
      else
        flash[:alert] = 'Correo o Contraseña incorrecta'
        redirect_to login_Login_path
      end
    end
  end
  
  def login(email,pass)

    params = {'email' => email, 'password' => pass}
    json_headers = {"Content-Type" => "application/json",
      "Accept" => "application/json"}
    uri = URI.parse('http://localhost:3000/authenticate')
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.post(uri.path, params.to_json, json_headers)
    
    
    if(response.body.length > 57 && response.body.length<37602)
      session[:logueado] = true;
      session[:nombre] = response.body["name"]; 
      print(response.body.length) 
      return true;
    else
      
      #@error_login = true;
      return false;
    end
  end
  
  def get_login
    if defined?(session[:logueado]) and session[:logueado]
      return session;
    else
      return false;
    end
  end
  def redireccion
    @sesion = get_login();
    if @sesion
      @nombre = @sesion[:nombre];
      redirect_to "/dash_board/Index"
    else
      redirect_to :controller => "login", :action => "iniciar_sesion";
    end
  end
end
