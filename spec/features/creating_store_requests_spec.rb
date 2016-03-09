require 'rails_helper'

RSpec.feature "CreatingStoreRequests", type: :feature do

  before do
    visit '/'
    click_link 'Iniciar solicitud'
  end

  scenario 'can create a store request' do
    fill_in 'Nombre Completo', with: 'Luis del Giudice'
    fill_in 'Nombre de la Tienda', with: 'Dettagli'
    fill_in 'Dirección de la Tienda', with: 'Cualquier dirección'
    fill_in 'Correo Electrónico', with: 'luis.dg19@gmail.com'
    fill_in 'Telefono', with: '12312312'
    fill_in 'Telefono de la tienda', with: '12312312'
    fill_in 'Contraseña', with: 's3cr3t'
    fill_in 'Confirmación de contraseña', with: 's3cr3t'

    click_button 'Solicitar'

    expect(page.current_url).to eql(store_request_successful_url)
  end
end
