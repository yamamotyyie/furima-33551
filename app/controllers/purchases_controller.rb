class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :item_sold

  def index
    @purchase_address = PurchaseAddress.new
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
  if @purchase_address.valid?
    pay_item
    @purchase_address.save
    redirect_to root_path
  else
    render action: :index
  end
  end


  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.price,
      card:purchase_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_sold
    unless @item.user_id != current_user.id
      redirect_to root_path
    end
  end
end
