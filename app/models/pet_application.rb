class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  enum status: {"pending": 0, "accepted": 1, "rejected": 2}

  def self.add_record(application_id, pet_id)
    create(application_id: application_id, pet_id: pet_id)
  end

  def change_status(status)
    if status == "accepted"
      self.accepted!
    elsif status == "rejected"
      self.rejected!
    end
  end
end
