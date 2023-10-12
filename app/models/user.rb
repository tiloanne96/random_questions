class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validate :validate_email

  def validate_email
    return false unless email.present?
    
    email_validation = Truemail.validate(email).result

    if email_validation.success
      true
    else
      errors.add(:email, *email_validation.errors.try(:values))
    end
  end
end
