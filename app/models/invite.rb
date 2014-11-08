class Invite
  include Mongoid::Document
  field :is_rsvp, type: Mongoid::Boolean
  field :is_sent, type: Mongoid::Boolean
  belongs_to :event
  belongs_to :user
end	
