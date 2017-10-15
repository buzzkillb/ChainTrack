class TracksController < ApplicationController
  def new
    @track = Track.new
    @track.wallets.build
  end

  def show
    @track = Track.find_by_token params[:id]
    redirect_to :root unless @track.present?
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to "/#{@track.token}", notice: 'Bookmark this page to easily access it in the future!'
    else
      render action: 'new'
    end
  end
  
  def summary
    @track = Track.find_by_token params[:id]
    render layout: false
  end
  
  private
  
  def track_params
    params.require(:track).permit(wallets_attributes: [:address, :description])
  end
end
