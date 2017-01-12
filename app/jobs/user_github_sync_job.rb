class UserGithubSyncJob < ApplicationJob
  queue_as :urgent

  def perform(user_id)
    user = User.find(user_id)
    user.sync_github_repos!
  end
end
