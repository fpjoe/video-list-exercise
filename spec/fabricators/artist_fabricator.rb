Fabricator(:artist) do
  title { Fabricate.sequence(:artist_title_suffix, 1) { |i| "Dean Martin #{i}" } }
  cached_slug { Fabricate.sequence(:artist_cached_slug_suffix, 1) { |i| "dean-martin-#{i}" } }
  external_id { Fabricate.sequence(:artist_external_id, 1) { |i| "#{i}" } }
end

Fabricator(:artist_with_custom_titles, from: :artist) do
  title 'Sinatra Lives'
end
