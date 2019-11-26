class Video < ActiveRecord::Base

  belongs_to :song

  validates :video_uid, presence: true

end
