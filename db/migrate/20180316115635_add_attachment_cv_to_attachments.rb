class AddAttachmentCvToAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :attachments do |t|
      t.attachment :cv
    end
  end

  def self.down
    remove_attachment :attachments, :cv
  end
end
