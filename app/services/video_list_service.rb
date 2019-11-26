class VideoListService

  def initialize(options = {})
    @song_title = options[:song_title]
    @artist_title = options[:artist_title]
    @city_title = options[:city_title]
  end

  def get_videos
    run_base_query

    apply_song_title

    apply_artist_title

    apply_city_title

    apply_sort

    @videos
  end

  private

  def run_base_query
    if @artist_title.blank? && @city_title.blank?
      @videos = Video.all.joins(:song).includes([:song])
    elsif @artist_title.present? && @city_title.blank?
      @videos = Video.all.joins(song: :artist).includes([:song])
    elsif @artist_title.blank? && @city_title.present?
      @videos = Video.all.joins(song: :city).includes([:song])
    elsif @artist_title.present? && @city_title.present?
      @videos = Video.all.joins(song: [:artist,:city]).includes([:song])
    end
  end

  def apply_song_title
    if @song_title.present?
      @videos =
        @videos.
          where("lower(songs.title) = ?",clean_param(@song_title))
    end
  end

  def apply_artist_title
    if @artist_title.present?
      @videos =
        @videos.
          where("lower(artists.title) = ?",clean_param(@artist_title))
    end
  end

  def apply_city_title
    if @city_title.present?
      @videos =
        @videos.
          where("lower(cities.title) = ?",clean_param(@city_title))
    end
  end

  def apply_sort
    @videos = @videos.order('videos.video_uid asc')
  end

  def clean_param(value)
    value.strip.downcase
  end
  
end
