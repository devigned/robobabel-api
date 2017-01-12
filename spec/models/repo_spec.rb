require 'rails_helper'

RSpec.describe Repo, type: :model do
  it 'should create a repo' do
    expect{Repo.create(name: 'blah', full_name: 'blah1234', url: 'http://blah.com')}.to_not raise_error
  end
end
