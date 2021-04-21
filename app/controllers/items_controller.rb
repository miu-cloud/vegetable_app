class ItemsController < ApplicationController
  def index
    @items = Item.all
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
  end
 
  private
  def item_params
    params.require(:item).permit(:title, :content, :count ,:place, :promise_at, :state, :image)
  end
end
