CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    # config.cache_dir = '../tmp/carrierwave'

    config.fog_credentials = {
      :provider           => 'Rackspace',
      :rackspace_username => 'eesamohammed',
      :rackspace_api_key  => '3de2927ce9254f2607a9ffd599a70bcf',
      :rackspace_region   => 'dfw'
    }
    config.fog_directory = "cdm_demo"
    config.asset_host = "http://c58218ef2ce3e71dc13c-03123b895063771b90e38e4b0667bb3b.r15.cf1.rackcdn.com"
  else
    config.storage = :file
  end
end
