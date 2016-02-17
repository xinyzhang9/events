class Event < ActiveRecord::Base

	has_many :users
  	has_many :users_registered,through: :event_register,source: :user
  	has_many :event_register, dependent: :destroy
  	has_many :comments

  	validates :name,:date,:location,:state,presence:true

  	validates_date :date, :after => lambda { Date.current }

end
