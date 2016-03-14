require 'rails_helper'

RSpec.feature "AddingItemToCarts", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }

  before do
    visit "/#{ store.identifier }"
  end

  scenario "adding an item to the cart" do
    click_link product.name
    click_button "Agregar al carrito"
    expect(page.current_url).to eq(store_cart_url(store.identifier))
    expect(page).to have_content product.name
    expect(page).to have_content "El Articulo fue agregado al carrito"
  end
end
