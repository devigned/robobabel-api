FactoryGirl.define do
  factory :user do
    uid '12345'
    provider 'github'
    name 'David Justice'
    nickname 'devigned'
    password 'supersecure123'
  end
end