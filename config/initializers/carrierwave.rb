CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    # config.cache_dir = '../tmp/carrierwave'

    config.fog_credentials = {
      :provider           => 'Rackspace',
      :rackspace_username => 'cdmgeneration',
      :rackspace_api_key  => 'c230660445ab4019aee077ad844d6ece',
      :rackspace_region   => 'dfw'
    }
    config.fog_directory = "cdm-production"
    config.asset_host = "http://74f83991cf514c4e6663-dc57254a24758b4af0852933688cfe33.r43.cf1.rackcdn.com"
  else
    config.storage = :file
    config.asset_host = ActionController::Base.asset_host
  end
end
