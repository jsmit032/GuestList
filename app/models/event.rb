class Event
  include Mongoid::Document
  field :name, type: String, default: "TBD"
  field :location, type: String, default: "TBD"
  field :date, type: Date
  field :time, type: Time
  field :venue, type: String, default: "TBD"
  field :venue_address, type: String, default: "TBD"

  has_many :invites

  validates :date, presence: true
  validates :time, presence: true

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
