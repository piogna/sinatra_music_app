require 'bcrypt'
class User < ActiveRecord::Base
  has_many :tracks

  has_secure_password
end
