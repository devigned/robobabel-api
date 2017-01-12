FactoryGirl.define do
  factory :user do
    uid '12345'
    provider 'github'
    name 'David Justice'
    nickname 'devigned'
    provider_token '12343432442'
  end
end