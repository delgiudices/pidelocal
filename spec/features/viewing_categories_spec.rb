require 'rails_helper'

RSpec.feature "ViewingCategories", type: :feature do

  let!(:store) { FactoryGirl.create(:store) }
  let!(:category) { FactoryGirl.create(:category, store: store) }
  let!(:category_2) { FactoryGirl.create(:category, store: store, name: 'Cat2', identifier: 'someothercat') }
  let!(:product) { FactoryGirl.create(:product, store: store, category: category) }
  let!(:product_2) { FactoryGirl.create(:product, store: store, category: category_2, name: "Segundo Nombre") }


  before do
    visit "/#{ store.identifier }"
  end

  scenario "viewing a category" do
    expect(page).to have_content product_2.name

    click_link category.name

    expect(page).not_to have_content product_2.name
    expect(page).to have_content product.name
  end

end
