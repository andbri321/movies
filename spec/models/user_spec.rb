require 'rails_helper'
RSpec.describe User, type: :model do
  it 'associations' do
    should have_many :movies
  end
end
