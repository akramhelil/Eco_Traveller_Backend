class TripsController < ApplicationController

    def index
        trips = Trip.all
        render json: trips
      end

    def show
        trip = Trip.find(params[:id])
        render json: trip
    end
  
    def create
        # byebug
        trip = Trip.find_or_create_by(trip_params)
        if trip
            trip.save
            render json: {trip: TripSerializer.new(trip)}
        else 
            render json: {errors: trip.errors.full_messages}
        end
    end

    def update
        trip = Trip.find_by(id: params[:id])
        byebug
    end
  
    def destroy
        trip = Trip.find_by(id: params[:id])
        trip.destroy
        render json: trip
    end

    private 

    def trip_params
        # traveller_id: nil, date: nil, name: 
        params.require(:trip).permit(:traveller_id, :date, :name)
    end
end
