class ContactoController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contacto])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Correo enviado.'
      redirect_to contacto_Contacto_path
    else
      flash[:alert] = 'No se envio el correo.' 
      redirect_to contacto_Contacto_path
    end
    
  end
end
