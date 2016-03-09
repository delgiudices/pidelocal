require 'rails_helper'

RSpec.feature "ViewingStores", type: :feature do

  before do
    @store = FactoryGirl.create(:store)

    visit "/#{@store.identifier}"
  end

  scenario 'visiting a created store' do
    expect(page).to have_title @store.name
  end

end
