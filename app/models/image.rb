class Image < ActiveRecord::Base
  attachment :image_data

  def presigned_url(expires_in = 7.days)
    return nil if self.image_data_id.blank?
    obj = Aws::S3::Object.new(S3_CONFIG['bucket'], "#{S3_CONFIG['prefix']}/#{self.image_data_id}")
    obj.presigned_url(:get, response_content_disposition: 'attachment', expires_in: expires_in)
  end
end
