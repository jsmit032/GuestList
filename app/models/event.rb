class Event
  include Mongoid::Document
  field :name, type: String
  field :location, type: String
  field :date, type: Date
  field :time, type: Time
  field :venue, type: String
  field :venue_address, type: String
end
