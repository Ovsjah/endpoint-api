class Provider < ApplicationRecord
  before_save { email.downcase! }
  
  validates_presence_of :email, :first_name, :last_name, :amount
  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
