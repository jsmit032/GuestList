class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_many :invites

  has_secure_password

  validates_uniqueness_of :email

end
