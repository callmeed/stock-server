# This initializes both
# Refile & S3 SDK in general

require "socket"
require "refile/s3"
require "refile/mini_magick"

# Load the S3 Credentials
S3_CONFIG = YAML.load_file(Rails.root.join('config/s3.yml'))[Rails.env]
# AWS/S3 options hash
aws = {
  access_key_id: S3_CONFIG['access_key_id'],
  secret_access_key: S3_CONFIG['secret_access_key'],
  region: S3_CONFIG['region'],
  bucket: S3_CONFIG['bucket']
}
# Setup the Refile cache and storage
Refile.cache = Refile::Backend::FileSystem.new(Rails.root.join('tmp/refile-cache'))
Refile.store = Refile::S3.new(prefix: S3_CONFIG['prefix'], **aws)
# CDN Host for refile
Refile.cdn_host = "//localhost:3000"

Aws.config.update({
                   region: S3_CONFIG['region'],
                   credentials: Aws::Credentials.new(S3_CONFIG['access_key_id'], S3_CONFIG['secret_access_key'])
                  })

##
# Refile Mini Magick patch to make sure portrait
# images are properly auto-rotated
# See: https://github.com/refile/refile-mini_magick/issues/1
Refile::MiniMagick.prepend Module.new {
  [:limit, :fit, :fill, :pad].each do |action|
    define_method(action) do |img, *args|
      super(img, *args)
      img.auto_orient
    end
  end
}
