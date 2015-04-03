class Pin < ActiveRecord::Base
  validates :description, presence:true
  validates :user_id, presence: true
  # :storage => :s3,
  # :s3_credentials => {
  #   :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  #   :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  #   },
  #   :path => ":attachment/:id/:style.:extension",
  #   :bucket => ENV['AWS_BUCKET']

  belongs_to :user
  has_attached_file :image, styles: { :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :image,
   # presence: true,
   content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }, size: { less_than: 5.megabytes }

   def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end
