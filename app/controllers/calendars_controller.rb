class CalendarsController < ApplicationController
  def index
    @post_id = params[:post_id]
      render 'calendar/index'
  end
end