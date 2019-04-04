require 'rails_helper'
RSpec.describe MoviesController, type: :controller do
  describe 'User with account' do
    let(:user) { User.create!(email: 'a@gmail.com', password:'123123') }
    let(:movie) { Movie.create!(user: user, description: 'Description',file: fixture_file_upload('leandro.mp4'))}

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

    describe 'GET #create' do
      it 'returns http success' do
        post :create, params: {
          movie: {description: 'filme 1',file: fixture_file_upload('leandro.mp4')}
        }
        expect(response).to have_http_status(302)
        expect(Movie.last.description).to eq('filme 1')
      end
    end

    describe 'GET #update' do
      it 'returns http success' do
    movie.id
        put :update, params: { id: movie.id,
          movie: {id: movie.id,description: 'des2'}
        }
        expect(response).to have_http_status(302)
        expect(movie.reload.description).to eq('des2')
      end
    end

    describe '#destroy' do
      it 'redirect' do
          delete :destroy, params: { id: movie.id }
          expect(response).to have_http_status(302)
      end
    end
  end
end
