class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end
  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to user_path(current_user.id)
    else
      render 'index'
    end
  end
  def show
    @purchases = Purchase.includes(:user).order("created_at DESC")
    @purchase = Purchase.where(user_id: params[:id])
  end

  private
  def purchase_params
    params.require(:purchase).permit(:price).merge(user_id: current_user.id,token: params[:token])
  end
  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"  
    Payjp::Charge.create(
      amount: purchase_params[:price],  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
