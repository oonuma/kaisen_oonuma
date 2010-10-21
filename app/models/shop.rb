class Shop < ActiveRecord::Base
  validates_presence_of :name, :description, :lines_summary
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)\Z}i,
                      :message => "はGIF,JPG,PNG画像のURLでなければなりません"
  validates_uniqueness_of :name
  scope :for_sale, :order => "created_at DESC"
end
