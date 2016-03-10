require 'rails_helper'

RSpec.feature "CreatingShippingAddresses", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
    visit "/#{ store.identifier }"
    click_link product.name
    click_button "Agregar al carrito"
    click_link "Pagar"
  end

  scenario "with valid attributes" do
    fill_in 'Nombre', with: 'Luis del Giudice'
    fill_in 'Telefono', with: '8296964737'
    select 'Santo Domingo'
    fill_in 'Dirección', with: 'La direccion mas jevi que tu has visto'
    click_button "Agregar Dirección"

    expect(page).to have_content "La dirección fue creada"
    expect(page).to have_content 'La direccion mas jevi que tu has visto'
    expect(page.current_url).to eq(checkout_url(store.identifier))
  end


end
