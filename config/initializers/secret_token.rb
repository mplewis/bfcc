st = 'dev_and_test_secret_token'
st = ENV['SECRET_TOKEN'] if Rails.env.production?
Rails.application.config.secret_token = st