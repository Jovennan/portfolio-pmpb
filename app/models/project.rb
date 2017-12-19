class Project < ApplicationRecord
  has_one :schedule
  accepts_nested_attributes_for :schedule

  belongs_to :client
  has_and_belongs_to_many :programmers


end
