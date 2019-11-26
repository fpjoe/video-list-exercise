Fabricator(:artist) do
  title { Fabricate.sequence(:artist_title_suffix) { |i| "Dean Martin #{i}" } }
  cached_slug { Fabricate.sequence(:artist_cached_slug_suffix) { |i| "dean-martin-#{i}" } }
  external_id { Fabricate.sequence(:artist_external_id) { |i| "#{i}" } }
end
