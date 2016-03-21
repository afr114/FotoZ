require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Get Index" do
    it "renders the index" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
