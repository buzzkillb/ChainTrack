class WalletsController < ApplicationController  
  def show
    @wallet = Wallet.find params[:id]
    render layout: false
  end
end
