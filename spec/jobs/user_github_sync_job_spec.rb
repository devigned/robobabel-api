require 'rails_helper'

RSpec.describe UserGithubSyncJob, type: :job do
  let(:user){ create(:user) }

  it 'should instantiate a user by id and sync with github' do
    expect(User).to receive(:find).with(user.id).and_return(user)
    expect(user).to receive(:sync_github_repos!)
    subject.perform(user.id)
  end
end
