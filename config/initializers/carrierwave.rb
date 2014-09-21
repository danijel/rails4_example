CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0755
  config.storage = :file
  if Rails.env.test?
    config.enable_processing = false
  else
    config.enable_processing = true
  end
end