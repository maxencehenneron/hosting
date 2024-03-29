class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 32 }, uniqueness: true
  validates :name, presence: true, length: { maximum: 32 }
  validates :surname, presence: true, length: { maximum: 32 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, :on => :create
  has_many :tickets
  after_initialize :defaults

  def defaults
    unless persisted?
      self.tokens=0
    end
  end
end
