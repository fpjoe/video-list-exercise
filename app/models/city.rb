class City < ActiveRecord::Base

  has_many :songs,
             dependent: :restrict_with_exception

  validates :title, presence: true
  validates :cached_slug, presence: true
  validates :external_id, presence: true
  validates :external_id, uniqueness: true

end
