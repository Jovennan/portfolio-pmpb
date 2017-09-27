class Sprint < ApplicationRecord
  belongs_to :schedule
  has_one :project, through: :schedule
end
