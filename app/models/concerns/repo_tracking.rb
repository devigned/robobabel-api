# https://developer.github.com/v3/repos/hooks/
module RepoTracking
  extend ActiveSupport::Concern

  included do
    after_save :github_hooks
  end

  DEFAULT_HOOK = {
      name: 'web',
      active: true,
      events: %w(pull_request comment issue issue_comment pull_request_review_comment push),
      config: {
          url: 'http://robobabel.com/github/webhook',
          content_type: 'json'
      }
  }

  def create_github_hook(user, hook = DEFAULT_HOOK)
    # POST /repos/:owner/:repo/hooks
    GH.with(token: user.provider_token) do
      GH.post("/repos/#{user.nickname}/#{self.repo.name}/hooks", hook)
    end
  end

  def edit_github_hook(user, updated_hook)
    # PATCH /repos/:owner/:repo/hooks/:id
    GH.with(token: user.provider_token) do
      GH.patch("/repos/#{user.nickname}/#{self.repo.name}/hooks", updated_hook)
    end
  end

  def destroy_github_hook(user, hook_id)
    # DELETE /repos/:owner/:repo/hooks/:id
    GH.with(token: user.provider_token) do
      GH.delete("/repos/#{user.nickname}/#{self.repo.name}/hooks/#{hook_id}")
    end
  end

  def github_hook_ping(user, hook_id)
    GH.with(token: user.provider_token) do
      GH.post("/repos/#{user.nickname}/#{self.repo.name}/hooks/#{hook_id}/ping")
    end
  end

  def github_hook_test(user, hook_id, test)
    # POST /repos/:owner/:repo/hooks/:id/tests
    GH.with(token: user.provider_token) do
      GH.post("/repos/#{user.nickname}/#{self.repo.name}/hooks/#{hook_id}/tests", test)
    end
  end

  def github_hooks(user)
    GH.with(token: user.provider_token) do
      GH["/repos/#{user.nickname}/#{self.repo.name}/hooks"]
    end
  end

end