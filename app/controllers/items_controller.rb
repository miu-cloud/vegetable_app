class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Item.ransack(params[:q])#.order(created_at: :desc)
    @items = @q.result
  end

  def new
    @item = Item.new
  end

  def show
    redirect_to items_path
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to items_path, alert: '不正なアクセスです！'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice:"投稿を削除しました！"
  end
 
  private

  def item_params
    params.require(:item).permit(:title, :content, :count ,:place, :promise_at, :state, :image)
  end
end
