class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def index
        @events = Event.includes(:venue).all
    end

    def show
        @event = Event.find params[:id]
    end

    def edit
        @event = Event.find params[:id]
    end

    def create
        @event = Event.new event_params
        if @event.save
            redirect_to @event, notice: 'Evento creado con éxito'
        else
            render 'new'
        end
    end

    def update
        @event = Event.find params[:id]
        if @event.update event_params
            redirect_to @event, notice: 'Evento creado con éxito'
        else
            render 'edit'
        end
    end

    def destroy
        @event = Event.find params[:id]
        @event.destroy
        redirect_to events_path
    end

    private
    def event_params
        params.require(:event).permit(:name, :venue_id, :category_id, :date)
    end
end