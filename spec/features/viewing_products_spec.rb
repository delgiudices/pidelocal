require 'rails_helper'

RSpec.feature "ViewingProducts", type: :feature do

  let(:store) { FactoryGirl.create(:store) }
  let(:category) { FactoryGirl.create(:category, store: store) }
  let(:product) { FactoryGirl.create(:product, store: store, category: category) }

  before do
    visit "/#{product.store.identifier}"
  end

  scenario "can view products" do
    click_link product.name

    expect(page.current_url).to eql(product_url(store.identifier, product))
    expect(page).to have_content product.description
  end



end
