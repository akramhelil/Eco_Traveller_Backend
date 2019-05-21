class AuthController < ApplicationController

    def login
        # byebug
      traveller = Traveller.find_by(username: params[:username])
      if traveller && traveller.authenticate(params[:password])
        token = encode_token(traveller.id)
        render json: {traveller: TravellerSerializer.new(traveller), token: token}
      else
        render json: {errors: "Invalid Password or Username, Please Try Again"}
      end
    end
  
    def auto_login
      # byebug
      if curr_traveller
        render json: curr_traveller
      else
        render json: {errors: traveller.errors.full_messages}
      end
    end

    private 

    def login_params
        params.require(:traveller).permit(:username, :password)
    end
  end