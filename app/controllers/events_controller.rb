class EventsController < ApplicationController
  def index
  	state = current_user.state
  	@events_in = Event.where(["state = ?", state])
  	@events_out = Event.where(["state != ?", state])
  	@users = User.all
  end

  def create
    @event = Event.new(name:params[:name],
    					date:params[:date],
    					location:params[:location],
    					state:params[:state],
    					user_id:current_user.id)
    if !@event.valid?
      flash[:errors] = @event.errors.full_messages
      redirect_to :back
      
    else
      @event.save
      redirect_to :back
    end
  end

  def show
  end

  def destroy
  end

 #  	private
 #  	def event_params
 #    	params.require(:event).permit(:name,:date,:location,:state)
	# end
end
