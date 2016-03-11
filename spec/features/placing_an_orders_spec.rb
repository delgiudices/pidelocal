require 'rails_helper'

RSpec.feature "PlacingAnOrders", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:shipping_address) { FactoryGirl.create(:shipping_address, user: user) }

  before do
    visit "/#{ store.identifier }"
    login_as(user, scope: :user)
    click_link product.name
    click_button "Agregar al carrito"
    click_link "Pagar"
  end

  scenario "with valid credit card details" do
    choose shipping_address.to_s
    fill_in "Numero de La Tarjeta", with: "1234-1234-1324-1234"
    select "Visa"
    fill_in "Mes", with: '08'
    fill_in "Año", with: '20'
    fill_in "CVV", with: '123'
    click_button "Revisar la Orden"
    expect(page.current_url).to eq(review_order_url(store.identifier))
    click_button "Colocar la orden"
    expect(page).to have_content "La orden fue colocada exitosamente"
  end


end
