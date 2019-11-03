class Organization < ApplicationRecord
  has_many :users
  has_many :utility_accounts
  has_many :buildings

  validates_presence_of :display_name
end
