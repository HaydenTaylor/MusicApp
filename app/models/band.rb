class Band < ActiveRecord::Base

  attr_reader :name

  has_many(
    :albums,
    class_name: "Album",
    foreign_key: :band_id,
    primary_key: :id,
    dependent: :destroy
  )

end
