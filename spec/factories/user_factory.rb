FactoryGirl.define do
  factory :user do
    uid '12345'
    provider 'github'
    name 'David Justice'
    nickname 'devigned'
    provider_token ENV['GH_PROVIDER_TOKEN'] || '12343432442'
  end
end