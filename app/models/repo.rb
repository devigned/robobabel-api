class Repo < ApplicationRecord
  belongs_to :user
  include RepoTracking

end
