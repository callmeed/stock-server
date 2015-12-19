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

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
