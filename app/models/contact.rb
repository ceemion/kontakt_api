class Contact < ApplicationRecord
  # serialize :phone_numbers, HashSerializer
  # store_accessor :phone_numbers, :mobile, :work, :home
  belongs_to :user
  validates_presence_of :first_name, :phone_numbers
end
