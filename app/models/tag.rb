class Tag < ApplicationRecord
  has_many :list_tags
  has_many :list_items, through: :list_tags
end
