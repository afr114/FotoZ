require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Get Index" do
    login_user
    it "renders the index" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
