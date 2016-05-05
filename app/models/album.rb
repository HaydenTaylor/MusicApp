class Album < ActiveRecord::Base

  attr_reader :name

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :track_id,
    primary_key: :id,
    dependent: :destroy
  )

end
