require 'rails_helper'
RSpec.describe Movie, type: :model do
  let(:user) { User.create!(email: "a@gmail.com",password: "123123") }
  let(:movie) { Movie.create!(user: user, description: 'Description') }

  it 'contagem das visualizações' do
    expect(movie.increment_visualization).to eql(true)
    expect(movie.visualization).to eql(1)
  end

  it 'associations' do
    should belong_to :user
  end

  it 'validate description presence' do
    expect(movie.update(description: '')).to eq(false)
    expect(movie.errors[:description].size).to be(1)
  end
end
