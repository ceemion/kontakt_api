class User < ApplicationRecord
  has_many :contacts
  devise :database_authenticatable, :recoverable, :validatable
  validates_presence_of :email, :name, :phone_number
  before_save :ensure_access_token

  def self.find_by_email email
    where(email: email).first
  end

  def ensure_access_token
    if access_token.blank?
      self.access_token = generate_access_token
    end
  end

  private

  def generate_access_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(access_token: token).first
    end
  end
end
