class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        user = User.find_by(username: params["session"]["username"])
        if user.authenticate(params["password"])
            puts "authenticated!!!!!"
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user
            }
        else
            puts "failed......."
            render json: {
                status: 401
            }
        end
    end
end
