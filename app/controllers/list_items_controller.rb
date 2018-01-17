class ListItemsController < ApplicationController
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]


  def index
    @list_items = ListItem.all
    respond_with(@list_items)
  end

  def show
    respond_with(@list_item)
  end

  def new
    @list_item = ListItem.new
    respond_with(@list_item)
  end

  def edit
  end

  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.save
    redirect_to lists_path
  end

  def update
    if params[:type] == "restore"
      restore(@list_item)
      redirect_to trashes_path
    else
      @list_item.update(list_item_params)
      redirect_to lists_path
    end
  end

  def destroy
    if params[:type] == "soft_delete"
      soft_delete(@list_item)
    else
      @list_item.destroy
    end
    redirect_to lists_path
  end


  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_list_item
      @list_item = params[:type] == "restore" ? ListItem.unscoped.find(params[:id]) : ListItem.find(params[:id])
    end

    def list_item_params
      params.require(:list_item).permit(:list_id, :title, :deleted_at)
    end
end
