class Song < ActiveRecord::Base

  has_many :videos,
             dependent: :restrict_with_exception

  belongs_to :artist,
               optional: true
  belongs_to :city,
               optional: true

  validates :title, presence: true
  validates :cached_slug, presence: true
  validates :external_id, presence: true
  validates :external_id, uniqueness: true

end
