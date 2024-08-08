class User < ApplicationRecord
  has_secure_password :password, validations: true
  validates :first_name,:last_name,:email, presence: true, uniqueness: true
end
