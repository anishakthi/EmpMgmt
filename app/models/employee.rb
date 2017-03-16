class Employee < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50} 
  validates :status, acceptance: {accept: ['Probation','Confirmed']}
  validates :dob, timeliness: { on_or_before: lambda { Date.current }, type: :date }
  validates :doj, presence: true
end
