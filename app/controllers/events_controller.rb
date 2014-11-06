class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def show
		@event = set_event
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_path
		else
			render 'new'
		end
	end

	def edit
		@event = set_event
	end

	def update
		@event = set_event
		if @event.update_attributes(event_params)
			redirect_to events_path
		else
			render 'edit'
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :location, :date, :time, :venue, :venue_address)
    end
end
