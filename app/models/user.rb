class User < ApplicationRecord
  include TokenAuthenticatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :notes, dependent: :destroy
end
