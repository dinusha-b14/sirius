require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe "GET #index" do
    context 'when signed in' do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
