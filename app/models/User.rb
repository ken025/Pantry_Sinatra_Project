class User < ActiveRecord::Base
     has_many :items

     has_secure_password
     
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :username, presence: true
    validates :username, uniqueness: true
end 