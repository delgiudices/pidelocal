require 'rails_helper'

RSpec.feature "LoggingIns", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }
  let!(:user) { FactoryGirl.create(:user, email: 'luis.dg19@gmail.com', password: 'secretpass') }

  scenario "after trying to access something that requires logging in" do
    visit checkout_path(store.identifier)
    fill_in "Correo Electrónico", with: 'luis.dg19@gmail.com'
    fill_in "Contraseña", with: 'secretpass'
    click_button "Ingresar"
    expect(page.current_url).to eq(checkout_url(store.identifier))
  end

end
