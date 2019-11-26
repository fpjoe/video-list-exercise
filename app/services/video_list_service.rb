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

    serialized_videos
  end

  private

  def run_base_query
    if @artist_title.blank? && @city_title.blank?
      @videos = Video.all.joins(:song)
    elsif @artist_title.present? && @city_title.blank?
      @videos = Video.all.joins(song: :artist)
    elsif @artist_title.blank? && @city_title.present?
      @videos = Video.all.joins(song: :city)
    elsif @artist_title.present? && @city_title.present?
      @videos = Video.all.joins(song: [:artist,:city])
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

  def clean_param(value)
    value.strip.downcase
  end

  def serialized_videos
    @videos.map{ |v| VideoSerializer.new(v).as_json }
  end
  
end
