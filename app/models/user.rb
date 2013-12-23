class User < ActiveRecord::Base
	attr_accessor :current
	def self.find_or_create_from_auth_hash(hash)
		user = User.find_by_facebook_uid hash.uid
		if user
			user.name = hash[:info][:name]
			user.photo = hash[:info][:image]
			user.save
		else
			user = User.create({
				facebook_uid: hash[:uid],
				name: hash[:info][:name],
				photo: hash[:info][:image]
			})
		end
		user
	end
end
