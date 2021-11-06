if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_my_real_estate_app', domain: 'https://tracking-app-rails-api.herokuapp.com'
else
    Rails.application.config.session_store :cookie_store, key: '_my_real_estate_app'
end