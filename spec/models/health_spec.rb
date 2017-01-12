require 'rails_helper'

RSpec.describe Health, type: :model do
  let(:subject){ Health.create(name: 'foo', status: 'bar') }

  it 'should have name of foo' do
    expect(subject.name).to eq('foo')
  end

  it 'should have status of bar' do
    expect(subject.status).to eq('bar')
  end
end