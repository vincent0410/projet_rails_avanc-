class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :confirmation_send

  def confirmation_send
    AttendanceMailer.attendee_email(self).deliver_now
  end
end 