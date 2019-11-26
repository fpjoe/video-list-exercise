require 'rails_helper'

RSpec.describe "Video list API", type: :request do

  describe 'GET /todos' do

    before(:each) do
      19.times { Fabricate(:video) }
      Fabricate(:video_with_custom_titles)
    end

    it "returns http status 200" do
      get '/videos'

      response_json = JSON.parse(response.body)

      expect(response).to have_http_status(200)
    end

    it "returns a list of all videos" do
      get '/videos'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 20
    end

    it "returns a list of 5 videos, with 5 videos per page requested" do
      get '/videos?per_page=5'

      response_json = JSON.parse(response.body)

      expect(response_json["videos"].length).to eq 5
    end

    it "returns a list of videos matching a particular song name" do
      get '/videos?song_title=Fly+Me+To+The+Moon'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 1
    end

    it "returns a list of videos matching a particular artist name" do
      get '/videos?artist_title=Sinatra+Lives'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 1
    end

    it "returns a list of videos matching a particular city name" do
      get '/videos?city_title=Chicago+Is+My+Kind+Of+Town'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 1
    end

    it "returns a list of 0 videos matching a particular song name we know doesn't exist" do
      get '/videos?song_title=All+My+Love'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 0
    end

    it "returns a list of 0 videos matching a particular artist name we know doesn't exist" do
      get '/videos?artist_title=Howard+Hughes'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 0
    end

    it "returns a list of 0 videos matching a particular city name we know doesn't exist" do
      get '/videos?city_title=Timbuktu'

      response_json = JSON.parse(response.body)

      expect(response_json["total_num_videos"]).to eq 0
    end

  end

end
