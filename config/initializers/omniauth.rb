Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['SIMPLE_CHAT_FACEBOOK_KEY'], ENV['SIMPLE_CHAT_FACEBOOK_SECRET']
end