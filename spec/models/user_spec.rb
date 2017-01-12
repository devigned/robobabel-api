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
      expect { described_class.find_or_create_user_from_auth_hash(auth_hash) }.to change { User.count }.from(0).to(1)
    end
  end

  describe 'with created user' do
    let(:subject) { create(:user) }

    describe '#github_repos' do

      it 'should make a request out to github' do
        req = stub_request(:get, "https://api.github.com/users/#{subject.nickname}/repos?per_page=100").
            with(:headers => {'Accept' => 'application/vnd.github.v3+json', 'Accept-Charset' => 'utf-8',
                              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                              'Authorization' => "token #{subject.provider_token}", 'User-Agent' => 'GH/0.15.0'}).
            to_return(:status => 200, :body => '', :headers => {})
        subject.github_repos
        expect(req).to have_been_requested
      end
    end

    describe '#sync_github_repos!' do
      let(:github_repos) {
        [
            {
                id: 1296269,
                owner: {
                    login: 'octocat',
                    id: 1,
                    avatar_url: 'https://github.com/images/error/octocat_happy.gif',
                },
                name: 'Hello-World',
                full_name: 'octocat/Hello-World',
                description: 'This your first repo!',
                private: false,
                fork: false,
                url: 'https://api.github.com/repos/octocat/Hello-World',
                html_url: 'https://github.com/octocat/Hello-World'
            },
            {
                id: 1296268,
                owner: {
                    login: 'octocat',
                    id: 1,
                    avatar_url: 'https://github.com/images/error/octocat_happy.gif',
                },
                name: 'Hello-New-World',
                full_name: 'octocat/Hello-New-World',
                description: 'This your second repo!',
                private: false,
                fork: false,
                url: 'https://api.github.com/repos/octocat/Hello-New-World',
                html_url: 'https://github.com/octocat/Hello-New-World'
            }
        ].map(&:stringify_keys)
      }

      it 'should add all of the repos from #github_repos to the existing user.repos' do
        create(:repo, user: subject)
        expect(subject).to receive(:github_repos).and_return(github_repos)
        expect { subject.sync_github_repos! }.to change { subject.repos.count }.from(1).to(3)
      end

      it 'should add new repos from #github_repos to the existing user.repos' do
        create(:repo, user: subject, github_id: 1296268)
        expect(subject).to receive(:github_repos).and_return(github_repos)
        expect { subject.sync_github_repos! }.to change { subject.repos.count }.from(1).to(2)
      end

      it 'should sync description from the payload' do
        expect(subject).to receive(:github_repos).and_return(github_repos)
        subject.sync_github_repos!
        expect(subject.repos.find_by_github_id(1296268).description).to_not be_empty
      end

    end

  end
end
