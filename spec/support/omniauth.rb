module OmniauthMacros
  def valid_github_login_setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:github, {
        provider: 'github',
        uid: '123545',
        info: {
            name: 'David Justice',
            nickname: 'devigned',
            email: 'david@devigned.com',
            image: 'https://avatars.githubusercontent.com/u/386473?v=3'
        },
        credentials: {
            token: 1234567891011,
            expires: false
        },
        extra: {
            raw_info: {
                login: 'devigned',
                id: 386473,
                avatar_url: 'https://avatars.githubusercontent.com/u/386473?v=3',
                url: 'https://api.github.com/users/devigned',
                name: 'David Justice',
                location: 'Seattle, WA',
                company: 'Microsoft',
                bio: 'Builder of things. @buspreneurs alumni. Co-founder of cisimple. I work for @Microsoft on @Azure.'
            }
        }
    })
  end
end
