CarrierWave.configure do |config|
  # For testing and development, upload files to local `tmp` folder.\
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = Rails.root.join('temp') if Rails.env.test?
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => Rails.application.secrets.s3_key,
      :aws_secret_access_key => Rails.application.secrets.s3_secret,
      :region                => Rails.application.secrets.s3_region
    }
    config.storage = :fog
    config.fog_directory    = Rails.application.secrets.s3_bucket_name
    # config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"    # To let CarrierWave work on heroku
end
