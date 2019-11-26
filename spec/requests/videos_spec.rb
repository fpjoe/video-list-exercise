require 'rails_helper'

RSpec.describe "Video list API", type: :request do

  describe 'GET /todos' do

    before(:each) do
      20.times { Fabricate(:video) }
    end

    it "returns http status 200" do
      get '/videos'

      response_json = JSON.parse(response.body)

      expect(response).to have_http_status(200)
    end

    it "returns a list of all videos" do
      get '/videos'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 20
    end

    it "returns a list of videos matching a particular song name" do
      get '/videos?song_title=Happy+Days+4'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 1
    end

    it "returns a list of videos matching a particular artist name" do
      get '/videos?artist_title=Dean+Martin+6'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 1
    end

    it "returns a list of videos matching a particular city name" do
      get '/videos?city_title=Chicago+12'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 1
    end

    it "returns a list of 0 videos matching a particular song name we know doesn't exist" do
      get '/videos?song_title=All+My+Love'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 0
    end

    it "returns a list of 0 videos matching a particular artist name we know doesn't exist" do
      get '/videos?artist_title=Howard+Hughes'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 0
    end

    it "returns a list of 0 videos matching a particular city name we know doesn't exist" do
      get '/videos?city_title=Timbuktu'

      response_json = JSON.parse(response.body)

      expect(response_json.length).to eq 0
    end

  end

end
