class Task < ApplicationRecord
  belongs_to :sprint
  belongs_to :programmer
  has_one :project, through: :sprint
end
