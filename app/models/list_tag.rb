class ListTag < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :list_item
  belongs_to :tag
end
