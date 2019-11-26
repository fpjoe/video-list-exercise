class VideosController < ApplicationController

  def index
    # TODO: Fill in with call to service
    videos = []

    render json: videos, status: :ok
  end

end
