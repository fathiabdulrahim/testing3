module SoftDelete
  extend ActiveSupport::Concern

  def soft_delete(object)
    object.update(deleted_at: Time.now)
  end

  def restore(object)
    object.update(deleted_at: nil)
  end

end