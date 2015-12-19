# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  title                   :string(255)
#  description             :text(65535)
#  status                  :integer
#  image_data_id           :string(255)
#  image_data_filename     :string(255)
#  image_data_size         :integer
#  image_data_content_type :string(255)
#  license_id              :integer
#  metadata                :text(65535)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Image < ActiveRecord::Base
  attachment :image_data

  def presigned_url(expires_in = 7.days)
    return nil if self.image_data_id.blank?
    obj = Aws::S3::Object.new(S3_CONFIG['bucket'], "#{S3_CONFIG['prefix']}/#{self.image_data_id}")
    obj.presigned_url(:get, response_content_disposition: 'attachment', expires_in: expires_in)
  end
end
