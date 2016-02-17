class User < ActiveRecord::Base
  has_secure_password

  has_many :events
  has_many :events_registered,through: :event_register,source: :event
  has_many :event_register, dependent: :destroy
  has_many :comments

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name,:location,:state,presence:true
  validates :email,presence:true,format:{with:EMAIL_REGEX},uniqueness:{case_sensitive:false}
  validates :password,presence:true,confirmation:true,on: :update, allow_blank: true
end
