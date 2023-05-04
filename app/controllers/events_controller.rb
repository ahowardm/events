class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    before_action :map_venues_and_categories, only: [:new, :edit]

    def new
        @event = Event.new
    end

    def index
        @events = Event.includes(:venue).all
    end

    def show
    end

    def edit
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
        if @event.update event_params
            redirect_to @event, notice: 'Evento creado con éxito'
        else
            render 'edit'
        end
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end

    private
    def event_params
        params.require(:event).permit(:name, :venue_id, :category_id, :date)
    end

    def find_event
        @event = Event.find params[:id]
    end

    def map_venues_and_categories
        @venues = Venue.all.map {|v| [v.name, v.id]}
        @categories = Category.all.map {|v| [v.name, v.id]}
    end
end