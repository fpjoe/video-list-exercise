class VideoSerializer < ActiveModel::Serializer
  attributes :video_uid

  belongs_to :song
end
