module SocialAccountHelper
  def get_url_from(account)
    return "https://#{account.provider}.com/#{account.url}"
  end
end
