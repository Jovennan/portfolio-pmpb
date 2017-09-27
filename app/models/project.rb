class Project < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :programmers
  has_one :schedule
end
