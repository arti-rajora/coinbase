OmniAuth.config.logger = Rails.logger
opts = { scope: 'user:email' }
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '480656619017306','87fdf346a155a9052063954ecd410961', opts
  provider :github, '3fd74b4689236965fc2e','1d0a9a7c84cc8be0ee5894dead34f11ebdd0b701' , opts
end