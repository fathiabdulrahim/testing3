class ListItem < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  belongs_to :list
  has_many :list_tags
  has_many :tags, through: :list_tags
end
