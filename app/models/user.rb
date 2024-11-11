class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email_domain

  private

  def email_domain
    unless email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i && email.ends_with?('@gmail.com')
      errors.add(:email, "must be a Gmail address")
    end
  end
end
