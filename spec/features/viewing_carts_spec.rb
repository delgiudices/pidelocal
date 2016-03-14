require 'rails_helper'

RSpec.feature "ViewingCarts", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }

  scenario "with no item in cart" do
    visit store_cart_path(store.identifier)
    expect(page).to have_content "No hay ningun articulo en el carrito"

    expect(page).not_to have_content "Pagar"
  end


end
