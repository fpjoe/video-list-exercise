Fabricator(:song) do
  title { Fabricate.sequence(:song_title_suffix) { |i| "Happy Days #{i}" } }
  cached_slug { Fabricate.sequence(:song_cached_slug_suffix) { |i| "happy-days-#{i}" } }
  external_id { Fabricate.sequence(:song_external_id) { |i| "#{i}" } }
  artist { Fabricate(:artist) }
  city { Fabricate(:city) }
end
