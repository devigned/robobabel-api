module OmniauthMacros
  def valid_github_login_setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, {
        provider: 'github',
        uid: '123545',
        info: {
            name: 'David Justice'
        }
    })
  end
end
