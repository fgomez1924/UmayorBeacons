require 'net/ftp'

class EnvioFtpController < ApplicationController
  def upload 
    if request.post?
      #Archivo subido por el usuario.
      archivo = params[:archivos][:archivo]
      #Nombre original del archivo.
      nombre = archivo.original_filename;
      #Extensión del archivo.
      extension = nombre.slice(nombre.rindex("."), nombre.length).downcase;
      if archivo.size <= 83886080
        if extension == ".jpg" or extension == ".png"
          ftp = Net::FTP.new('192.168.10.110')
          ftp.login(user = "delerium", passwd = "admin1328")
          ftp.storbinary("STOR " + archivo.original_filename, StringIO.new(archivo.read), Net::FTP::DEFAULT_BLOCKSIZE)
          ftp.quit()
          flash[:notice] = 'Imagen enviada.'
          redirect_to envio_ftp_EnvioFtp_path
        else
          flash[:alert] = 'Tipo de formato incorrecto.'
          redirect_to envio_ftp_EnvioFtp_path
        end
      else
        flash[:alert] = 'Tamaño del archivo muy grande.'
        redirect_to envio_ftp_EnvioFtp_path
      end
    end
  end
end
