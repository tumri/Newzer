class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url =>
                    ':s3_domain_url',
                    :path =>
                    '/:class/:attachment/:id/:basename.:extension'

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 50.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
