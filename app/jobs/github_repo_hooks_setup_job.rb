class GithubRepoHooksSetupJob < ApplicationJob
  queue_as :default

  def perform(user_id, repo_id, tracked)
    user = User.find(user_id)
    repo = user.repos.find(repo_id)
    if tracked
      hook = repo.create_github_hook(user)
    else
      repo.destroy_github_hook(user)
    end
  end
end
