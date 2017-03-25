require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views
  let(:user) { create(:user) }

  describe "GET #index" do
    context 'when signed in' do
      before do
        sign_in(user)
        get :index
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not signed in' do
      before { get :index }

      it 'redirects to sign_in page' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
