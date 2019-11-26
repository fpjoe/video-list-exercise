class SongSerializer < ActiveModel::Serializer
  attributes :title, :cached_slug, :external_id
  
  has_many :videos
  belongs_to :artist
  belongs_to :city
end
