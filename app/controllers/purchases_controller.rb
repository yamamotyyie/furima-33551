class PurchasesController < ApplicationController
def index
  @purchase_address = PurchaseAddress.new
  @item = Item.find(params[:item_id])
end

def create
  @item = Item.find(params[:item_id])
  @purchase_address = PurchaseAddress.new(purchase_params)
  if @purchase_address.valid?
    @purchase_address.save
    redirect_to root_path
 else
   render action: :index
 end
end


private

def purchase_params
  params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :number).merge(user_id: current_user.id,item_id: params[:item_id])
end
end
