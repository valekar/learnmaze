#CarrierWave.configure do |config|
 # config.root = Rails.root
#end

CarrierWave.configure do |config|
  config.remove_previously_stored_files_after_update = false
   

# config.root = Rails.root.join('tmp') # adding these...
 # config.cache_dir = 'carrierwave'

end
