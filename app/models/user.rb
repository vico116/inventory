class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  enum :role, { admin: 0, manager: 1, operator: 2 }
  
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
