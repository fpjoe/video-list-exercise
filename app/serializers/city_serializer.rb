class CitySerializer < ActiveModel::Serializer
  attributes :title, :cached_slug, :external_id

  has_many :songs
end
