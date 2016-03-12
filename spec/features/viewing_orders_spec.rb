require 'rails_helper'

RSpec.feature "ViewingOrders", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shipping_address) { FactoryGirl.create(:shipping_address, user: user) }
  let!(:order) { FactoryGirl.create(:order, user: user, store: store) }
  let!(:order_item) { FactoryGirl.create(:order_item, order: order) }


  scenario "not logged in" do
    visit store_orders_path(store.identifier)
    expect(page).to have_content "Debe iniciar sesión"
    expect(page.current_url).to include(store_url(store.identifier))
  end

  scenario "listing all orders" do
    login_as(user, scope: :user)
    visit store_path(store.identifier)
    click_link "Mis ordenes"
    expect(page.current_url).to eq(store_orders_url(store.identifier))
    expect(page).to have_content order_item.name

  end


end
