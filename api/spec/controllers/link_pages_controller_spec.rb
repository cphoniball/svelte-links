require 'rails_helper'

RSpec.describe LinkPagesController, type: :controller do

  describe "GET #index" do
    it "returns http success", skip: true do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #get" do
    it "returns http success", skip: true do
      get :get
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success", skip: true do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success", skip: true do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success", skip: true do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
