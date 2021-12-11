Rails.application.config.middleware.use OmniAuth::Builder do
  ENV["GOOGLE_CLIENT_ID"]='404326152766-lo7lr1p7l3phgrnebuk0nch45m03bvv6.apps.googleusercontent.com'
  ENV["GOOGLE_CLIENT_SECRET"]='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'
  
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: "userinfo.profile,youtube,userinfo.email",
    access_type: 'offline',
    approval_prompt: 'force'
  }
end
OmniAuth.config.allowed_request_methods = %i[get]
  