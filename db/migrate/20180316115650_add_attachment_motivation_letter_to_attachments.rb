class AddAttachmentMotivationLetterToAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :attachments do |t|
      t.attachment :motivation_letter
    end
  end

  def self.down
    remove_attachment :attachments, :motivation_letter
  end
end
