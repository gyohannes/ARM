class Region < ApplicationRecord
  has_many :participants

  def to_s
    name
  end
end
