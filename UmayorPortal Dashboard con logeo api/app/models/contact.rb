class Contact < MailForm::Base
  attribute :nombre,      :validate => true
  attribute :apellido
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :telefono
  attribute :mensaje

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contacto",
      :to => "hector.gonzalez@rightcom.cl",
      :from => %("#{nombre}" "#{apellido}" <#{email}>)
    }
  end
end