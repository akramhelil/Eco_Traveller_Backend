class TravellersController < ApplicationController

    def index
        travellers = Traveller.all
        render json: travellers
      end

    def show
        traveller = Traveller.find(params[:id].to_i)
        render json: traveller
    end
  
    def create
        traveller = Traveller.create(traveller_params)
        if traveller
            traveller.save
            token = encode_token(traveller.id)
            render json: {traveller: TravellerSerializer.new(traveller), token: token}
        else 
            render json: {errors: traveller.errors.full_messages}
        end
    end

    def update
        traveller = Traveller.find_by(id: params[:id])
        if traveller
            traveller.update(traveller_params)
            token = encode_token(traveller.id)
            render json: {traveller: TravellerSerializer.new(traveller), token: token}
        else 
            render json: {errors: " Something Went Wrong!"}
        end
    end
  
    def destroy
        traveller = Traveller.find_by(id: params[:id])
        traveller.destroy
        render json: traveller
    end

    private 

    def traveller_params
        # first_name: nil, last_name: nil, username: nil, password_digest: nil, profile_photo: nil, email: nil, about: nil
        params.require(:traveller).permit(:first_name, :last_name, :username, :password, :profile_photo,:email, :about)
    end

end
