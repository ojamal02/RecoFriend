OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1669503223357514
', 'cf2d9576c849a3cfaea7237982c719e3', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
