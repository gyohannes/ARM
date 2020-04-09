class Event < ApplicationRecord

  has_many :participants

  has_one_attached :logo

  def self.current
    self.where('status = ?', true).first
  end

  def current_status
    status? ? 'Active' : ''
  end

  def amharic_year
    unless end_date.blank?
      amharic_date = ethiopic_date_format(fromGregorianToEthiopic(end_date.year,end_date.month,end_date.day))
      return amharic_date.split(',')[1]
    end
  end

  def from_amharic_month_day
    unless start_date.blank?
      amharic_date = ethiopic_date_format(fromGregorianToEthiopic(start_date.year,start_date.month,start_date.day))
      return amharic_date.split(',')[0]
    end
  end

  def to_amharic_month_day
    unless end_date.blank?
      amharic_date = ethiopic_date_format(fromGregorianToEthiopic(end_date.year,end_date.month,end_date.day))
      return amharic_date.split(',')[0]
    end
  end

  def to_s
    name
  end

end
