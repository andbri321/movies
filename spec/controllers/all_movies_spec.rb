require 'rails_helper'
RSpec.describe AllMoviesController, type: :controller do
  describe 'User with account' do
    let(:user) { User.create!(email: 'a@gmail.com', password:'123123') }
    let(:movie) { Movie.create!(user: user,description:'des') }
    before(:each) do
      sign_in(user)

      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns http success' do
        get :show, params: {id: movie.id}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
