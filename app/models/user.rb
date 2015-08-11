class User < ActiveRecord::Base
  has_many :wins
  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :password, presence: true, on: :create
end
