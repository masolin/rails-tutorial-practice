require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  fixtures :users

  before :each do
    @user = users(:michael)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #following" do
    it "should redirect following when not logged in" do
      get :following, id: @user
      expect(response).to redirect_to(login_url)
    end
  end

  describe "GET #followers" do
    it "should redirect followers when not logged in" do
      get :followers, id: @user
      expect(response).to redirect_to(login_url)
    end
  end
end
