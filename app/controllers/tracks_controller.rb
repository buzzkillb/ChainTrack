class TracksController < ApplicationController
  def new
    @track = Track.new
    @track.wallets.build
  end
  
  def create
    @track = Track.new(track_params)
    if human?(@track) && @track.save
      redirect_to "/#{@track.token}", notice: 'Bookmark this page to easily access it in the future!'
    else
      render action: 'new'
    end
  end

  def edit
    @track = Track.find_by_token params[:id]
  end
  
  def update
    @track = Track.find_by_token params[:id]
    if human?(@track) && @track.update_attributes(track_params)
      redirect_to "/#{@track.token}", notice: 'Update successful!'
    else
      render action: 'edit'
    end
  end

  def show
    @track = Track.find_by_token params[:id]
    redirect_to :root unless @track.present?
  end
  
  def destroy
    track = Track.find_by_token params[:id]
    track.destroy
    redirect_to :root, notice: 'Deleted!'
  end

  def summary
    @track = Track.find_by_token params[:id]
    render layout: false
  end
  
  private
  
  def track_params
    params.require(:track).permit(wallets_attributes: [:id, :address, :description, :_destroy])
  end
  
  def human? model
    Rails.env.development? || verify_recaptcha(model: model)
  end
end
