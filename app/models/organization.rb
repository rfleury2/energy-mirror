class Organization < ApplicationRecord
  has_many :users

  validates_presence_of :display_name
end
