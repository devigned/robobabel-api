require 'rails_helper'

RSpec.describe 'Authentication' do

  describe '/auth/github/' do
    before(:each) do
      valid_github_login_setup
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      get '/auth/github'
      follow_redirect!
    end

    it 'should set user_id' do
      expect(User.last.uid).to eq('123545')
    end

    it 'should set name' do
      expect(User.last.name).to eq('David Justice')
    end
  end

  describe '/auth/sign_in' do
    %w(/sign_in /sign_up cancel edit).each do |path|
      it "#{path} should 404" do
        expect { get('/auth' + path) }.to raise_error(ActionController::RoutingError)
      end
    end

    it 'should 404 for new session creation' do
      expect { post('/auth/sign_in') }.to raise_error(ActionController::RoutingError)
    end

    it 'should 404 for new user registration (email registration -- only github right now)' do
      expect { post('/auth/') }.to raise_error(ActionController::RoutingError)
    end

  end

end