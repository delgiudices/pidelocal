require 'rails_helper'

RSpec.describe StoreRequestsController, type: :controller do

  it "can see store request form" do
    get :new
    expect(response).to be_success
  end

  it "can create store requests" do
    post :create, store_request: {
      full_name: 'Luis del Giudice',
      email: 'luis.dg19@gmail.com',
      store_name: 'Dettagli',
      phone: '8296964737',
      store_phone: '8099675461',
      password: '123456',
      store_address: 'some address'
    }
    expect(StoreRequest.last.full_name).to eq('Luis del Giudice')
    expect(response).to redirect_to(store_request_successful_path)
  end

  it "renders the new template on create failed" do
    post :create, store_request: {full_name: nil}

    expect(response).to render_template("new")
  end

end
