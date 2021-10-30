if Rails.env == "production"
  # todo: don't know if we need to config domain in production
  # Rails.application.config.session_store :cookie_store, key: "_swapp-api", domain: "swapp-json-api"
  Rails.application.config.session_store :cookie_store, key: "_swapp-api"
else
  Rails.application.config.session_store :cookie_store, key: "_swapp-api"
end
