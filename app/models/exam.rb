class Exam < ApplicationRecord
  belongs_to :applicant

  before_save :set_total, if: :exam_and_interview_result_exists

  def exam_and_interview_result_exists
    !exam_result.blank? and !interview_result.blank?
  end

  def self.import_exam(file)
    exams = []
    CSV.foreach(file.path, :headers=>true) do |row|
      applicant_id = row[0]
      email = row[1]
      exam_result = row[2]
      exam_out_of = row[3]
      unless applicant_id.blank?
        attrbts = {applicant_id: applicant_id, exam_result: exam_result,
                   exam_out_of: exam_out_of }
        exam = Exam.find_by_applicant_id(applicant_id) || new
        exam.attributes = attrbts
        exam.save!
        exams << exam
      end
    end
    return exams
  end

  def self.import_interview(file)
    interviews = []
    CSV.foreach(file.path, :headers=>true) do |row|
      applicant_id = row[0]
      email = row[1]
      interview_result = row[2]
      interview_out_of = row[3]
      unless applicant_id.blank?
        applicant = Applicant.find_by_id(applicant_id)
        attrbts = {applicant_id: applicant_id, interview_result: interview_result,
                   interview_out_of: interview_out_of }
        unless applicant.blank?
          interview = Exam.find_by_applicant_id(applicant_id) || new
          interview.attributes = attrbts
          interview.save!
          interviews << interview
        end
      end
    end
    return interviews
  end

  def set_total
    setting = Setting.first
    unless setting.blank?
      self[:total] = (((exam_result/exam_out_of) * setting.exam_weight) +
          ((interview_result/interview_out_of) * setting.interview_weight) +
          added_mark).round(2)
    end
  end

  def added_mark
    setting = Setting.first
    unless setting.blank?
      return applicant.gender == 'Female' ? setting.additional_marks_for_female : 0
    else
      return 0
    end
  end

end
