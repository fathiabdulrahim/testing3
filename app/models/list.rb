class List < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  has_many :list_items, dependent: :destroy
end
