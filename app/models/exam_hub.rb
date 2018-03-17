class ExamHub < ApplicationRecord
  belongs_to :region

  validates :region_id, :name, :city, presence: true

  def to_s
    name
  end

end
