FactoryGirl.define do
  factory :repo do
    name 'robo-test'
    full_name 'devigned/robo-test'
    description 'A repo where there are super codez'
    private false
    github_id 1234335
    homepage 'http://example.com'
    language 'Ruby'
    tracked false
    user
  end
end
