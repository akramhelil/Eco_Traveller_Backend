class AuthController < ApplicationController

    def login
      traveller = Traveller.find_by(username: params[:username])
      if traveller && traveller.authenticate(params[:password])
        token = encode_token(traveller.id)
        render json: {traveller: TravellerSerializer.new(traveller), token: token}
      else
        render json: {errors: traveller.errors.full_messages}
      end
    end
  
    def auto_login
      if curr_traveller
        render json: curr_traveller
      else
        render json: {errors: traveller.errors.full_messages}
      end
    end
    
  
  end