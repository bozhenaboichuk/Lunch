# frozen_string_literal: true

ImageKitIo.configure do |config|
  config.public_key = ENV['IMAGEKITIO_PUBLIC_KEY']
  config.private_key = ENV['IMAGEKITIO_PRIVATE_KEY']
  config.url_endpoint = ENV['IMAGEKITIO_ENDPOINT_URL']
  
  config.service = :carrierwave
  # config.service = :active_storage
  # config.constants.MISSING_PRIVATE_KEY = 'custom error message'
end
