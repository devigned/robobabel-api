FactoryGirl.define do
  factory :repo do
    name 'my-super-repo'
    full_name 'devigned/my-super-repo'
    description 'A repo where there are super codez'
    private false
    url 'https://api.github.com/repos/octocat/Hello-World'
    html_url 'https://github.com/octocat/Hello-World'
    user
  end
end
