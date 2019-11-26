Fabricator(:city) do
  title { Fabricate.sequence(:city_title_suffix, 1) { |i| "Chicago #{i}" } }
  cached_slug { Fabricate.sequence(:city_cached_slug_suffix, 1) { |i| "chicago-#{i}" } }
  external_id { Fabricate.sequence(:city_external_id, 1) { |i| "#{i}" } }
end

Fabricator(:city_with_custom_titles, from: :city) do
  title 'Chicago Is My Kind Of Town'
end
