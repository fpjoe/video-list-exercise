class VideosController < ApplicationController

  DEFAULT_PER_PAGE = 25

  def index
    videos =
      VideoListService.new(
        song_title:   params[:song_title],
        artist_title: params[:artist_title],
        city_title:   params[:city_title]
      ).get_videos

    render json: index_result(videos), status: :ok
  end

  private

  def index_result(videos)
    {
      videos:           paginate_list(videos),
      total_num_videos: videos.count,
      page:             get_page,
      per_page:         get_per_page
    }
  end

  def paginate_list(objects)
    objects.paginate(
      page:     get_page,
      per_page: get_per_page
    )
  end

  def get_page
    if params[:page] && params[:page] =~ /^\d+$/
      params[:page]
    else
      1
    end
  end

  def get_per_page
    if params[:per_page] && params[:per_page] =~ /^\d+$/
      params[:per_page]
    else
      DEFAULT_PER_PAGE
    end
  end

end
