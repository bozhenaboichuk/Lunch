# frozen_string_literal: true

ImageKitIo.configure do |config|
  imagekitio_secrets = Rails.application.secrets.imagekitio
  config.public_key = ENV['IMAGEKITIO_PUBLIC_KEY'] || imagekitio_secrets[:public_key]
  config.private_key = ENV['IMAGEKITIO_PRIVATE_KEY'] || imagekitio_secrets[:private_key]
  config.url_endpoint = ENV['IMAGEKITIO_ENDPOINT_URL'] || imagekitio_secrets[:url_endpoint]

  config.service = :carrierwave
  # config.service = :active_storage
  # config.constants.MISSING_PRIVATE_KEY = 'custom error message'
end
