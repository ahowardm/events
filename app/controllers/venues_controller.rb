class VenuesController < ApplicationController
    def new
        @venue = Venue.new
    end

    def index
        @venues = Venue.all
    end

    def show
        @venue = Venue.find params[:id]
        @events = @venue.events
    end

    def edit
        @venue = Venue.find params[:id]
    end

    def create
        @venue = Venue.new venue_params
        if @venue.save
            redirect_to @venue, notice: 'Locación creada con éxito'
        else
            render 'new'
        end
    end

    def update
        @venue = Venue.find params[:id]
        if @venue.update venue_params
            redirect_to @venue, notice: 'Locación actualizada con éxito'
        else
            render 'edit'
        end
    end

    def destroy
        @venue = Venue.find params[:id]
        @venue.destroy
        redirect_to venues_path
    end

    private
        def venue_params
            params.require(:venue).permit(:name, :address, :capacity)
        end
end