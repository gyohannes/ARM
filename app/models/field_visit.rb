class FieldVisit < ApplicationRecord
  has_many :participants

  validates :name, presence: true

  def to_s
    name
  end

end
