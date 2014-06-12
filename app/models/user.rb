class User < ActiveRecord::Base
	has_many :photos
	has_many :usergroups
	has_many :groups, through: :usergroups
end
