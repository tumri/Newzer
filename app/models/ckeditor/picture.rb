class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url    =>
                    ':s3_domain_url',
                    :path   =>
                    '/:class/:attachment/:id/:style_:basename.:extension',
                    :styles =>
                    { :content => '800>', :thumb => '118x100#' }

  validates_attachment_presence     :data

  validates_attachment_size         :data,
                                    :less_than => 5.megabytes

  validates_attachment_content_type :data,
                                    :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
