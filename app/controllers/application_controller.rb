class ApplicationController < ActionController::API

    def encode_token(travller_id)
        JWT.encode({travller_id: travller_id}, "12345")
      end
    
      def get_token
        request.headers["Authorization"]
      end
    
      def decode_token
        begin
          JWT.decode(get_token, "12345")[0]["travller_id"]
        rescue
          # Token invalid, return nil
          nil
        end
      end
    
      def curr_traveller
        Traveller.find_by(id: decode_token)
      end
end
