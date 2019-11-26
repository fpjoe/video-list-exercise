Fabricator(:song) do
  title { Fabricate.sequence(:song_title_suffix, 1) { |i| "Happy Days #{i}" } }
  cached_slug { Fabricate.sequence(:song_cached_slug_suffix, 1) { |i| "happy-days-#{i}" } }
  external_id { Fabricate.sequence(:song_external_id, 1) { |i| "#{i}" } }
  artist { Fabricate(:artist) }
  city { Fabricate(:city) }
end

Fabricator(:song_with_custom_titles, from: :song) do
  title 'Fly Me To The Moon'
  artist { Fabricate(:artist_with_custom_titles) }
  city { Fabricate(:city_with_custom_titles) }
end
