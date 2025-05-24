require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let!(:user) { create(:user) }
  before { sign_in user, scope: :user }

  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/pages/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /new" do
  #   it "returns http success" do
  #     get "/pages/new"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/pages/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/pages/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
