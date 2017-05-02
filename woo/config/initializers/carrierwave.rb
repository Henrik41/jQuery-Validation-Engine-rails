CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['S3_BUCKET_NAME']
#  config.aws_acl    = :public_read
#  config.asset_host = 'http://localhost:3000'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    
     }
     
     if Rails.env.development?
       CarrierWave.configure do |config|
         config.storage = :file
       end
     end
  
end