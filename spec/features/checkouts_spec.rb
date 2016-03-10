require 'rails_helper'

RSpec.feature "Checkouts", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit "/#{ store.identifier }"
    click_link product.name
    click_button "Agregar al carrito"
  end

  scenario "not logged in" do
    click_link "Pagar"
    expect(page.current_url).to include(new_user_session_url)
  end

  scenario "logged in" do
    login_as(user, scope: :user)
    click_link "Pagar"
    expect(page.current_url).to eq(checkout_url(store.identifier))
  end

end
