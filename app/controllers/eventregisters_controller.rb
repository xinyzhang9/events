class EventregistersController < ApplicationController
  def create
    user = current_user
    event = Event.find(params[:event_id])
    @event_register = EventRegister.new(user:user,event:event)
    if !@event_register.save
      flash[:errors] = @event_register.errors.full_messages
      redirect_to :back
      
    else
      @event_register.save
      redirect_to :back
    end
  end

  def destroy
  	@event_register = EventRegister.where(["user_id = ?", 
  									current_user.id]).where(["event_id = ?",
  														params[:event_id]]).first

  	@event_register.destroy
  	redirect_to :back
  end
end
