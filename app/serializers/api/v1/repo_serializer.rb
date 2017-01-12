class Api::V1::RepoSerializer < Api::V1::ApplicationSerializer
  attributes :id, :name, :full_name, :description, :private, :url, :html_url
  has_one :user
end
