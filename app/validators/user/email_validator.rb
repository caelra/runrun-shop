# frozen_string_literal: true

class User
  # Email validations Class
  class EmailValidator < ActiveModel::EachValidator
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/

    def validate(record)
      record.errors.add(:email, :blank) if record.email.blank?
      record.errors.add(:email, :too_long) unless record.email.length <= 255
      record.errors.add(:email, :invalid) unless record.email =~ VALID_EMAIL_REGEX
    end
  end
end
