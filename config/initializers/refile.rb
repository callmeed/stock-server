# This initializes both
# Refile & S3 SDK in general

require "socket"
require "refile/s3"
require "refile/mini_magick"

##
# Load the S3 Credentials
# Amazon S3 credentials are loaded from ENV
# If you'd rather load them from a YAML file in config/
# uncomment the line below
#
# S3_CONFIG = YAML.load_file(Rails.root.join('config/s3.yml'))[Rails.env]

##
# Load S3 config from ENV (comment out if you're using a YAML file)
S3_CONFIG = {}
S3_CONFIG['access_key_id'] = ENV['access_key_id']
S3_CONFIG['secret_access_key'] = ENV['secret_access_key']
S3_CONFIG['region'] = ENV['region']
S3_CONFIG['bucket'] = ENV['bucket']
S3_CONFIG['prefix'] = ENV['prefix']

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
