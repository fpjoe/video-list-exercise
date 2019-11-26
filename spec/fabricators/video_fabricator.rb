Fabricator(:video) do
  video_uid { Fabricate.sequence(:video_uid_suffix) { |i| "whiEjkfik#{i}" } }
  song { Fabricate(:song) }
end

