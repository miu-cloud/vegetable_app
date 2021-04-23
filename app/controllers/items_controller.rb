class ItemsController < ApplicationController

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to item_path(@item)
  end

  def edit
    @item = Item.find(params[:id])
  end
 
  private

  def item_params
    params.require(:item).permit(:title, :content, :count ,:place, :promise_at, :state, :image)
  end
end
