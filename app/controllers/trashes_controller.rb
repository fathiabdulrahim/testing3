class TrashesController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.unscoped.where.not(deleted_at: nil)
    @list_items = ListItem.unscoped.where.not(deleted_at: nil)
    @tags = ListTag.unscoped.where.not(deleted_at: nil)
  end
end
