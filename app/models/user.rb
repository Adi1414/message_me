class User < ApplicationRecord
    has_secure_password
    validates :username , presence: true, length: {maximum: 30, minimum: 3}
    validates :password , presence: true, length: {maximum: 30, minimum: 3},allow_nil: true,
               uniqueness: { case_sensitive: false }
    has_many :messages
end
