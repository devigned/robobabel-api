FactoryGirl.define do
  factory :user do
    uid '12345'
    provider 'github'
    name 'David Justice'
    nickname 'devigned'
  end
end