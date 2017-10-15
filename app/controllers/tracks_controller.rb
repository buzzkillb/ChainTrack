class TracksController < ApplicationController
  def new
    @track = Track.new
    2.times { @track.wallets.build }
  end

  def show
  end

  def create
  end
end
