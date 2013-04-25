class Guest < ActiveRecord::Base
	attr_accessible :name

	has_many :meal
end