class Cuidador < ApplicationRecord
    has_secure_password
    validates :cpf, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

    has_one :animal
    accepts_nested_attributes_for :animal, :allow_destroy => true
end
