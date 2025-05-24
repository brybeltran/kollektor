# spec/requests/authentication_spec.rb
require "rails_helper"

RSpec.describe "User authentication", type: :request do
  let(:user) { create(:user, password: "secretpass", password_confirmation: "secretpass") }

  it "signs in with valid credentials" do
    post user_session_path, params: {
      user: { email: user.email, password: "secretpass" }
    }
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response.body).to include("Signed in successfully")
  end

  it "rejects invalid credentials" do
    post user_session_path, params: {
      user: { email: user.email, password: "wrong" }
    }
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
