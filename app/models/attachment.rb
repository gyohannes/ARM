class Attachment < ApplicationRecord
  belongs_to :applicant

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :photo

  has_attached_file :cv
  validates_attachment_content_type :cv, content_type: ['application/pdf',"application/doc", "application/docx"]
  validates_attachment_presence :cv

  has_attached_file :motivation_letter
  validates_attachment_content_type :motivation_letter, content_type: ['application/pdf',"application/doc", "application/docx"]
  validates_attachment_presence :motivation_letter

  has_attached_file :sponsorship_letter
  validates_attachment_content_type :sponsorship_letter, content_type: ['application/pdf',"application/doc", "application/docx"]
  validates_attachment_presence :sponsorship_letter

end
