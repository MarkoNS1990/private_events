class AttendeesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendee = Attendee.new(attendee_params)

    @attendee.save
    redirect_to root_path
  end

  def attendee_params
    params.require(:attendee).permit(:event_id, :user_id)
  end
end
