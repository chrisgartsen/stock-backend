Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://stock-8112e.firebaseapp.com/'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end
