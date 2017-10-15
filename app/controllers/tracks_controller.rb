class TracksController < ApplicationController
  def new
    @track = Track.new
    2.times { @track.wallets.build }
  end

  def show
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to @track
    else
      render action: 'new'
    end
  end
  
  private
  
  def track_params
    params.require(:track).permit(wallets_attributes: [:address, :description])
  end
end
