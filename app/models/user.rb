class User < ActiveRecord::Base
  validates :username, presense: true, 
            uniqueness: {case_senstive: false}, 
            length:  {minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presense: true, length:  {maximum: 105 },
            uniqueness: {case_senstive: false},
            format: { with: VALID_EMAIL_REGEX } 
end