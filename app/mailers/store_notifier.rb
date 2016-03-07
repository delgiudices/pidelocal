class StoreNotifier < ApplicationMailer

  def create_store_request_email(store_request)
    attachments.inline['pidelocal.png'] = File.read(Rails.root.join("public/images/pidelocal.png"))
    @store_request = store_request
    mail(to: @store_request.email, subject: 'Solicitud de tienda en pidelocal.com')
  end

end
