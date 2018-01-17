class ListTagsController < ApplicationController
  before_action :set_list_tag, only: [:show, :edit, :update, :destroy]


  def index
    @list_tags = ListTag.all
    respond_with(@list_tags)
  end

  def show
    respond_with(@list_tag)
  end

  def new
    @list_tag = ListTag.new(list_item_id: params[:list_item_id])
    respond_with(@list_tag)
  end

  def edit
  end

  def create
    @list_tag = ListTag.new(list_tag_params)
    @list_tag.save
    redirect_to lists_path
  end

  def update
    if params[:type] == "restore"
      restore(@list_tag)
      redirect_to trashes_path
    else
      @list_tag.update(list_tag_params)
      redirect_to lists_path
    end
  end

  def destroy
    if params[:type] == "soft_delete"
      soft_delete(@list_tag)
    else
      @list_tag.destroy
    end
    redirect_to lists_path
  end


  private
    def set_list_tag
      @list_tag = params[:type] == "restore" ? ListTag.unscoped.find(params[:id]) : ListTag.find(params[:id])
    end

    def list_tag_params
      params.require(:list_tag).permit(:tag_id, :list_item_id, :deleted_at)
    end
end
