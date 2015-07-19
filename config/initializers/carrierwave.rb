CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    # config.cache_dir = '../tmp/carrierwave'

    config.fog_credentials = {
      :provider           => 'Rackspace',
      :rackspace_username => 'cdmgeneration2',
      :rackspace_api_key  => '3e3366ecd4174e768223f1e8a4896bdb',
      :rackspace_region   => 'dfw'
    }
    config.fog_directory = "cdm-production"
    config.asset_host = "http://1d0a8b4c250cc24b5eb9-a3cb6292aa3b047007f9ae237bc150e3.r83.cf1.rackcdn.com"
  else
    config.storage = :file
    config.asset_host = ActionController::Base.asset_host
  end
end
