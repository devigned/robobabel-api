class Api::V1::RepoSerializer < Api::V1::ApplicationSerializer
  attributes :id, :name, :full_name, :description, :private, :github_id, :homepage, :language, :tracked
  has_one :user
end
