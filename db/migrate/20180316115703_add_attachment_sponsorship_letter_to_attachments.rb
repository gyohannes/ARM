class AddAttachmentSponsorshipLetterToAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :attachments do |t|
      t.attachment :sponsorship_letter
    end
  end

  def self.down
    remove_attachment :attachments, :sponsorship_letter
  end
end
