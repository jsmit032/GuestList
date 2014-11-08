class Event
  include Mongoid::Document
  field :name, type: String
  field :location, type: String
  field :date, type: Date
  field :time, type: Time
  field :venue, type: String
  field :venue_address, type: String

  has_many :invites

  def users
    User.find user_ids
  end

  def user_ids
  	user_ids_array = []
  	self.invites.each do |one_invite|
  		if one_invite.user_id && one_invite.user_id
  			user_ids_array.push one_invite.user_id
  		end
  	end
  	user_ids_array
  end

  def user_ids=(list)
  	self.invites.destroy
  	list.each do |user_id|
  		self.invites.create(user_id: user_id)
  	end
  end

end
