Fabricator(:city) do
  title { Fabricate.sequence(:city_title_suffix) { |i| "Chicago #{i}" } }
  cached_slug { Fabricate.sequence(:city_cached_slug_suffix) { |i| "chicago-#{i}" } }
  external_id { Fabricate.sequence(:city_external_id) { |i| "#{i}" } }
end
