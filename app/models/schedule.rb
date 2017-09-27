class Schedule < ApplicationRecord
  belongs_to :project
  has_many :sprints
  has_many :tasks, through: :sprints
end
