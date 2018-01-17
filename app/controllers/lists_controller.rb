class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]


  def index
    @lists = List.all
    respond_with(@lists)
  end

  def show
    respond_with(@list)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  def update
    if params[:type] == "restore"
      restore(@list)
      redirect_to trashes_path
    else
      @list.update(list_params)
      redirect_to lists_path
    end
  end

  def destroy
    if params[:type] == "soft_delete"
      soft_delete(@list)
    else
      @list.destroy
    end
    redirect_to lists_path
  end

  private
    def set_list
      @list = params[:type] == "restore" ? List.unscoped.find(params[:id]) : List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :deleted_at)
    end
end
