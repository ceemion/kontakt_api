class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :rememberable, :trackable
  devise :database_authenticatable, :recoverable, :validatable
end
