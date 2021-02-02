class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:destroy]
  before_action :set_item, only: [:show,:destroy]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    unless current_user.id == @item.user_id
      redirect_to action: :show
    end
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:item_name,:text,:price,:image,:category_id,:status_id,:burden_id,:prefecture_id,:ship_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
