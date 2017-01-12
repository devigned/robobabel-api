FactoryGirl.define do
  factory :repo do
    name 'my-super-repo'
    full_name 'devigned/my-super-repo'
    description 'A repo where there are super codez'
    private false
    github_id 1234335
    homepage 'http://example.com'
    language 'Ruby'
    tracked false
    user
  end
end
