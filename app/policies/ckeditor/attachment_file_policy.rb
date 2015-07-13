class Ckeditor::AttachmentFilePolicy
  attr_reader :user, :attachment

  def initialize(user, attachment)
    @user = user
    @attachment = attachment
  end

  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present?
    attachment.assetable_id == user.id
  end
end
