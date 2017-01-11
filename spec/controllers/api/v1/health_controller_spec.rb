require 'rails_helper'

RSpec.describe Api::V1::HealthController do

  describe 'not authenticated' do
    describe '#index' do
      it 'should respond with a 401' do
        get :index
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'authenticated' do
    let! (:user) {create(:user)}

    before do
      authenticate_user(user)
    end

    it 'should respond successfully with hello world json' do
      get :index
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq({'status' => 'healthy!'})
    end
  end


end