require 'rails_helper'

RSpec.describe User do
  let!(:auth_hash) {
    {
        provider: 'github',
        uid: '123545',
        info: {
            name: 'David Justice',
            nickname: 'devigned',
            email: 'david@devigned.com',
            image: 'https://avatars.githubusercontent.com/u/386473?v=3'
        },
        credentials: {
            token: 1234567891011,
            expires: false
        },
        extra: {
            raw_info: {
                login: 'devigned',
                id: 386473,
                avatar_url: 'https://avatars.githubusercontent.com/u/386473?v=3',
                url: 'https://api.github.com/users/devigned',
                name: 'David Justice',
                location: 'Seattle, WA',
                company: 'Microsoft',
                bio: 'Builder of things. @buspreneurs alumni. Co-founder of cisimple. I work for @Microsoft on @Azure.'
            }
        }
    }
  }

  describe '#find_or_create_user_from_auth_hash' do
    it 'should create user if user does not exist' do
      expect { described_class.find_or_create_user_from_auth_hash(auth_hash) }.to change{User.count}.from(0).to(1)
    end
  end

  describe '#github_repos' do
    it 'should make a request out to github'
  end

  describe '#sync_github_repos!' do
    it 'should add the repos from #github_repos to the existing user.repos'
  end
end
