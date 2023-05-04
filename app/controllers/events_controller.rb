class EventsController < ApplicationController
    def index
        @events = Event.includes(:venue).all
    end

    def show
        @event = Event.find params[:id]
    end
end