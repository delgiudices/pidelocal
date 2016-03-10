require 'rails_helper'

RSpec.feature "RemovingItemFromCarts", type: :feature do
  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }

  before do
    visit "/#{ store.identifier }"
  end

  scenario "adding an item to the cart" do
    click_link product.name
    click_button "Agregar al carrito"
    expect(page).to have_content product.name
    click_link "Eliminar del carrito"
    expect(page).not_to have_content product.name
    expect(page).to have_content "El articulo fue eliminado del carrito"
    end

end
