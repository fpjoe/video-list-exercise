Fabricator(:video) do
  video_uid { Fabricate.sequence(:video_uid_suffix, 1) { |i| "whiEjkfik#{i}" } }
  song { Fabricate(:song) }
end

Fabricator(:video_with_custom_titles, from: :video) do
  song { Fabricate(:song_with_custom_titles) }
end
