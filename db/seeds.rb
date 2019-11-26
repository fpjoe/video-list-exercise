#
# This file should contain all the record creation needed to seed the
# database with its default values.  The data can then be loaded with the
# rake db:seed (or created alongside the db with db:setup).
#

SEED_DATA_DIR = "db/seed_data"

videos_file = "#{SEED_DATA_DIR}/videos.json"

if !Video.exists?

  videos_file_contents = IO.read(videos_file)

  if videos_file_contents.present?

    num_videos = 0

    JSON.parse(videos_file_contents).each do |each_video|

      if each_video['song'].present?

        if each_video['song']['artist_id'].nil?
          artist = nil
        else

          artist = Artist.where(external_id: each_video['song']['artist_id']).first

          if !artist && each_video['song']['artist'].present?
            artist =
              Artist.create(
                title:       each_video['song']['artist']['title'],
                cached_slug: each_video['song']['artist']['cached_slug'],
                external_id: each_video['song']['artist']['id']
              )
            if !artist
              raise "ERROR: Could not save artist #{each_video['song']['artist']}, " +
                    "errors were: #{artist.errors.messages.map { |m| m[1][0] }}.join(', ')"
            end
        end

        end # End if we have an artist_id

        if each_video['song']['city_id'].nil?
          city = nil
        else

          city = City.where(external_id: each_video['song']['city_id']).first

          if !city && each_video['song']['city'].present?
            city =
              City.create(
                title:       each_video['song']['city']['title'],
                cached_slug: each_video['song']['city']['cached_slug'],
                external_id: each_video['song']['city']['id']
              )
            if !city
              raise "ERROR: Could not save city #{each_video['song']['city']}, " +
                    "errors were: #{city.errors.messages.map { |m| m[1][0] }}.join(', ')"
            end
          end

        end # End if we have a song_id

        song = Song.where(external_id: each_video['song']['id']).first

        if !song
          song =
            Song.create(
              title:       each_video['song']['title'],
              cached_slug: each_video['song']['cached_slug'],
              external_id: each_video['song']['id'],
              artist:      artist,
              city:        city
            )
        end

        if !song
          raise "ERROR: Could not save song #{each_video['song']}, " +
                "errors were: #{song.errors.messages.map { |m| m[1][0] }}.join(', ')"
        end

        Video.create!( 
          video_uid: each_video['video_uid'],
          song:      song
        )

        num_videos += 1

      end # End if we have a song

    end # End of loop over videos

    puts "Videos added: #{num_videos}"

  end # End if videos_file_contents present 

end # End if any videos already exist in system
